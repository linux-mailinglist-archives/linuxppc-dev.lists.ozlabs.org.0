Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 350132166D7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 08:52:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Cm03rv3zDqlc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:52:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Cjj0kwgzDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 16:50:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=YwaPRTTw; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4B1Cjh6GYVz9sDX;
 Tue,  7 Jul 2020 16:50:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1594104600;
 bh=XxSVlOVeuXBXeR0SuUFJvzVwby+z8Og+fh11sk2yoWY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=YwaPRTTwPqVFK76ks31VuslNsYouA+p4GUe3mGyNzxfFmSF30fhGntuqNs9vQfpYo
 0UxD4Es9PBzLERYJMFDKnQNZRzLQQ3o6eAKHwG7WKx5OeWT/Imy0rLi0FFIhZvQktn
 yDzBxx2VMPCPcth8XNGUgVH0KncrdrYBJ9WvSmL+Cs5NislBsJhEsRcKap8jOm/O4x
 1V91x6udF1gf8MkdnJMAH2jn7LQ51b+d6CJ7UXjMCWVtpuV5Sml7Qf8ovyInF0bn6e
 7nbAywZZ2CLBR5yV2vBa7MAn7nij3pqJGFTbQI0mnEJtHE0g5dZlfc+2kOcXtwPAIZ
 nDsZh0QqyW1gg==
Received: by neuling.org (Postfix, from userid 1000)
 id BA7362C0672; Tue,  7 Jul 2020 16:50:00 +1000 (AEST)
Message-ID: <babc98c50100bb2cc925a6518bdb885909f0c473.camel@neuling.org>
Subject: Re: [PATCH v2 06/10] powerpc/perf: power10 Performance Monitoring
 support
From: Michael Neuling <mikey@neuling.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
Date: Tue, 07 Jul 2020 16:50:00 +1000
In-Reply-To: <1593595262-1433-7-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-7-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> @@ -480,6 +520,7 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
>  	mmcr[1] =3D mmcr1;
>  	mmcr[2] =3D mmcra;
>  	mmcr[3] =3D mmcr2;
> +	mmcr[4] =3D mmcr3;

This is fragile like the kvm vcpu case I commented on before but it gets pa=
ssed
in via a function parameter?! Can you create a struct to store these in rat=
her
than this odd ball numbering?

The cleanup should start in patch 1/10 here:

        /*
         * The order of the MMCR array is:
-        *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2
+        *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2, MMCR3
         *  - 32-bit, MMCR0, MMCR1, MMCR2
         */
-       unsigned long mmcr[4];
+       unsigned long mmcr[5];



mikey
