Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6A49BD18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 21:27:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjz1h6CMRz3bTs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 07:27:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jfnP7t3V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=jfnP7t3V; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jjz146j99z2x9M
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 07:27:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3Bb23zhtgzU7Wxmk6KGQnnxzZSeCxUCxB/mlyZEzbkg=; b=jfnP7t3Va434azfa7CGwqEJbQ3
 qHZG/qaQxtDi2ObBW5J1jYfDwVfVM7ZUb5kf4IPYmQuegN1jWD+hLfCoF4eox6NUOrbMDbRDvd01P
 JRJWLy/SP3edGvoUXvlMLgzz1kTXs+G5BrMyJV7syMki25lRyu8gdthFr1hhQvQHZupGC5DWg66N/
 LEQ1I7WT1IB4ucPJrXH5MM71+fYSk0pRh4AF7UjEH0NX75oo6gxDediH1BwVk6Y3UAqpWY5jK9vW+
 tzDWcn98pI0mUU6JoOfNXyWnp1tDG/xMPd+7rh9K+brTE+sbTmSPvJI5KJmcklnDNhzERB4gNoR6J
 gznneLpg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nCSPJ-009Utb-SO; Tue, 25 Jan 2022 20:27:13 +0000
Date: Tue, 25 Jan 2022 12:27:13 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>
Subject: Re: [PATCH v5 6/6] module: Move duplicate mod_check_sig users code
 to mod_parse_sig
Message-ID: <YfBdIdVqOriKF+yA@bombadil.infradead.org>
References: <cover.1641900831.git.msuchanek@suse.de>
 <687db74a714d50b9c83d7ac024da4f7dec0d9a1d.1641900831.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <687db74a714d50b9c83d7ac024da4f7dec0d9a1d.1641900831.git.msuchanek@suse.de>
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 11, 2022 at 12:37:48PM +0100, Michal Suchanek wrote:
> Multiple users of mod_check_sig check for the marker, then call
> mod_check_sig, extract signature length, and remove the signature.
> 
> Put this code in one place together with mod_check_sig.
> 
> This changes the error from ENOENT to ENODATA for ima_read_modsig in the
> case the signature marker is missing.
> 
> This also changes the buffer length in ima_read_modsig from size_t to
> unsigned long. This reduces the possible value range on 32bit but the
> length refers to kernel in-memory buffer which cannot be longer than
> ULONG_MAX.
> 
> Also change mod_check_sig to unsigned long while at it.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
