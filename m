Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0846155235
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 06:58:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DPjm4Fh6zDqjV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 16:58:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DPhH1kDwzDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 16:57:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=KK2oJUJh; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48DPhG1j93z9sPJ;
 Fri,  7 Feb 2020 16:57:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1581055022;
 bh=iFVZIWwToD+UxnnTwmLQqVug7RUgTp+GximpZwvnZiw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=KK2oJUJhG3TqkiS8SRzXBFdukeOv0IHrXh+4v0aSZa7zDDlc8J1Emvm8yn7WNZjj5
 n9W50r/LRXFl5xxnH+caWGNlUIOTpIkQHgjMkyxNygXzOFerZCMZumBLjP+buIAp7H
 jRy/3+K14prRKTeT7sMX6/dSPCHAGDTi3Vdtct24mHWEsWIqqCPxNyiu5LhGh+5855
 PxKk9WyqVFXR14shNzgYcb2aLfk0W0ctrugHX04i2rGCFPpfEsavTQrodP/gNYUIQw
 w+zGeW4hBetNWBAwy7cExOQXYJHSmjDH4uA6h2/hEBiKCzH1/RsE9DFlJhqLLLgngI
 YyW/i98kI+ePA==
Received: by neuling.org (Postfix, from userid 1000)
 id 1A6D92C019C; Fri,  7 Feb 2020 16:57:02 +1100 (AEDT)
Message-ID: <71427c6b8d8e00461fa27e603db2012e8215f467.camel@neuling.org>
Subject: Re: [PATCH V5 06/14] powerpc/vas: Setup thread IRQ handler per VAS
 instance
From: Michael Neuling <mikey@neuling.org>
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
Date: Fri, 07 Feb 2020 16:57:01 +1100
In-Reply-To: <1579680639.26081.31.camel@hbabu-laptop>
References: <1579679802.26081.6.camel@hbabu-laptop>
 <1579680639.26081.31.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: herbert@gondor.apana.org.au, npiggin@gmail.com, hch@infradead.org,
 oohall@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>  /*
> + * Process CRBs that we receive on the fault window.
> + */
> +irqreturn_t vas_fault_handler(int irq, void *data)
> +{
> +	struct vas_instance *vinst =3D data;
> +	struct coprocessor_request_block buf, *crb;
> +	struct vas_window *window;
> +	void *fifo;
> +
> +	/*
> +	 * VAS can interrupt with multiple page faults. So process all
> +	 * valid CRBs within fault FIFO until reaches invalid CRB.
> +	 * NX updates nx_fault_stamp in CRB and pastes in fault FIFO.
> +	 * kernel retrives send window from parition send window ID
> +	 * (pswid) in nx_fault_stamp. So pswid should be non-zero and
> +	 * use this to check whether CRB is valid.
> +	 * After reading CRB entry, it is reset with 0's in fault FIFO.
> +	 *
> +	 * In case kernel receives another interrupt with different page
> +	 * fault and CRBs are processed by the previous handling, will be
> +	 * returned from this function when it sees invalid CRB (means 0's).
> +	 */
> +	do {
> +		mutex_lock(&vinst->mutex);

This isn't going to work.

From Documentation/locking/mutex-design.rst

    - Mutexes may not be used in hardware or software interrupt
      contexts such as tasklets and timers.

Mikey

