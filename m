Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD149BD02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 21:24:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjyxs2074z3bcc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 07:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zs3kdWGP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=Zs3kdWGP; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjyxD2CTbz2yMj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 07:24:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8jiAAbr8zjyas8ne1Zsnl8EfrMwDftxtsxyZx5EZ57c=; b=Zs3kdWGPYxRaR0Lyl8LsCxUojd
 FFbsw3pyxYrZ3IXIN8AF9RJ2qJ/Bmqcq2TAd6QT97fTEJJEFH59N5EDUXItL67rTvqu9CELDUkQ+i
 Uq1OFX4NMD28J5kX4RmW2tWk2EloLum46S6lt5QX8psuNiE8k3FRvZ5otiABScKNxYFCnOmYjIJ7f
 +Jf+ktkVVjy9xeba6ZX6Vk6EFOOytBwL3uw9rF5ICEep7gNmiJbbL9ISoXGxu/dq8g6Z96luSyUeh
 S4RZni/SQBT61HceEIDWZTN/SkrD1UpDe7IJTO6rRWoQOpjyw970iqk7dkaHA9OIckeBBYkUmjUDv
 rJLNxzvg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nCSM3-009UF5-Sa; Tue, 25 Jan 2022 20:23:51 +0000
Date: Tue, 25 Jan 2022 12:23:51 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>,
	David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v5 4/6] module: strip the signature marker in the
 verification function.
Message-ID: <YfBcVy62MidVTtux@bombadil.infradead.org>
References: <cover.1641900831.git.msuchanek@suse.de>
 <96d29773b9ef418a71b1d8bbfd0a456a0f996ec6.1641900831.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96d29773b9ef418a71b1d8bbfd0a456a0f996ec6.1641900831.git.msuchanek@suse.de>
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
 Sven Schnelle <svens@linux.ibm.com>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Baoquan He <bhe@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
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

On Tue, Jan 11, 2022 at 12:37:46PM +0100, Michal Suchanek wrote:
> It is stripped by each caller separately.
> 
> Note: this changes the error for kexec_file from EKEYREJECTED to ENODATA
> when the signature marker is missing.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v3: - Philipp Rudo <prudo@redhat.com>: Update the commit with note about
>       change of raturn value
>     - the module_signature.h is now no longer needed for kexec_file

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
