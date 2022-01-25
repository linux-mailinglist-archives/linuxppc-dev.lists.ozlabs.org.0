Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA49549BD2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 21:31:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjz605HWCz3bcc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 07:31:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u7umuGco;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=u7umuGco; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jjz5M0jY8z2xCp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 07:30:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eAYuA3IYpDa6asQzwjsBPd1aG38lL6DwpQeaWb0KZyc=; b=u7umuGcoWurUr5OPmMAUZ3xGOO
 YZiX6q/jpumt1aXHBk0BRLa5mmm9kCWWQpjv+D+DNgzXt/hAZ/1V8K68SoeXS2I4ruU9h1fnzRxL7
 Q+v8WVLR5gsp86yCkzDQtJhNLAl0+mfJakpZ69hu4fKdKAkmEtvCPvmiRSlDnANtsDQT6pz4hjSzR
 xMbM9JQTQYMOR+ZtpeyzckbV9oBqTDIZOAdvoQRotKUuqC5AMSg6f3IBy3cCqcPm6s/ntnHh2qrQf
 Qn7DZFJJ/KLQ2aRQ9i+Rk7qAATcNDR2Tc7uzY7jX7MYwF/4xCi5ms7LWHkr//RCN1H/PeV/jKv5KR
 lb1i4Ksw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nCSSq-009VdS-1L; Tue, 25 Jan 2022 20:30:52 +0000
Date: Tue, 25 Jan 2022 12:30:52 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>, David Howells <dhowells@redhat.com>,
 Aaron Tomlin <atomlin@redhat.com>
Subject: Re: [PATCH v5 0/6] KEXEC_SIG with appended signature
Message-ID: <YfBd/EDGUx9UIHcb@bombadil.infradead.org>
References: <cover.1641900831.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1641900831.git.msuchanek@suse.de>
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

On Tue, Jan 11, 2022 at 12:37:42PM +0100, Michal Suchanek wrote:
> Hello,
> 
> This is a refresh of the KEXEC_SIG series.
> 
> This adds KEXEC_SIG support on powerpc and deduplicates the code dealing
> with appended signatures in the kernel.
> 
> powerpc supports IMA_KEXEC but that's an exception rather than the norm.
> On the other hand, KEXEC_SIG is portable across platforms.
> 
> For distributions to have uniform security features across platforms one
> option should be used on all platforms.
> 
> Thanks
> 
> Michal
> 
> Previous revision: https://lore.kernel.org/linuxppc-dev/cover.1637862358.git.msuchanek@suse.de/
> Patched kernel tree: https://github.com/hramrach/kernel/tree/kexec_sig
> 
> Michal Suchanek (6):
>   s390/kexec_file: Don't opencode appended signature check.
>   powerpc/kexec_file: Add KEXEC_SIG support.
>   kexec_file: Don't opencode appended signature verification.
>   module: strip the signature marker in the verification function.
>   module: Use key_being_used_for for log messages in
>     verify_appended_signature
>   module: Move duplicate mod_check_sig users code to mod_parse_sig

What tree should this go through? I'd prefer if over through modules
tree as it can give a chance for Aaron Tomlin to work with this for his
code refactoring of kernel/module*.c to kernel/module/

  Luis
