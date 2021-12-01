Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97668464501
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 03:38:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3jvd1Fcjz3cPD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 13:38:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+Ol4RLX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+Ol4RLX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=O+Ol4RLX; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+Ol4RLX; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3jtt0C8Pz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 13:38:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638326286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0n5k4sl9AYBphe6cujkRUTAtSAAGA+Ca8Fn1jgb3kw=;
 b=O+Ol4RLXyBqV5wQ+7nusXk4FlNrZ5qx36lCOj24yp2bkUguqC4735vuczW3U9CNXJqEG0X
 LfOwArou01NKyg2NI/EZx5MCcAoq8LNjWIWPB5GzwKEAYgUa1RrJlJc/n0XgH2jnpHeRhM
 CEHMi2x38nfPwb7vIgmNdL9/MYaFFO8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638326286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0n5k4sl9AYBphe6cujkRUTAtSAAGA+Ca8Fn1jgb3kw=;
 b=O+Ol4RLXyBqV5wQ+7nusXk4FlNrZ5qx36lCOj24yp2bkUguqC4735vuczW3U9CNXJqEG0X
 LfOwArou01NKyg2NI/EZx5MCcAoq8LNjWIWPB5GzwKEAYgUa1RrJlJc/n0XgH2jnpHeRhM
 CEHMi2x38nfPwb7vIgmNdL9/MYaFFO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-420-PtZgyoLZM6iWg_vjmPTmng-1; Tue, 30 Nov 2021 21:38:04 -0500
X-MC-Unique: PtZgyoLZM6iWg_vjmPTmng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 133C5102C7EB;
 Wed,  1 Dec 2021 02:37:59 +0000 (UTC)
Received: from localhost (ovpn-12-42.pek2.redhat.com [10.72.12.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ADC560C13;
 Wed,  1 Dec 2021 02:37:50 +0000 (UTC)
Date: Wed, 1 Dec 2021 10:37:47 +0800
From: Baoquan He <bhe@redhat.com>
To: Michal Suchanek <msuchanek@suse.de>
Subject: Re: [PATCH v2 0/6] KEXEC_SIG with appended signature
Message-ID: <20211201023747.GN21646@MiWiFi-R3L-srv>
References: <cover.1637862358.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1637862358.git.msuchanek@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-crypto@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 11/25/21 at 07:02pm, Michal Suchanek wrote:
> Hello,
> 
> This is resend of the KEXEC_SIG patchset.
> 
> The first patch is new because it'a a cleanup that does not require any
> change to the module verification code.
> 
> The second patch is the only one that is intended to change any
> functionality.
> 
> The rest only deduplicates code but I did not receive any review on that
> part so I don't know if it's desirable as implemented.

Do you have the link of your 1st version?

And after going through the whole series, it doesn't tell what this
patch series intends to do in cover-letter or patch log.

Thanks
Baoquan

> 
> The first two patches can be applied separately without the rest.
> 
> Thanks
> 
> Michal
> 
> Michal Suchanek (6):
>   s390/kexec_file: Don't opencode appended signature check.
>   powerpc/kexec_file: Add KEXEC_SIG support.
>   kexec_file: Don't opencode appended signature verification.
>   module: strip the signature marker in the verification function.
>   module: Use key_being_used_for for log messages in
>     verify_appended_signature
>   module: Move duplicate mod_check_sig users code to mod_parse_sig
> 
>  arch/powerpc/Kconfig                     | 11 +++++
>  arch/powerpc/kexec/elf_64.c              | 14 ++++++
>  arch/s390/kernel/machine_kexec_file.c    | 42 ++----------------
>  crypto/asymmetric_keys/asymmetric_type.c |  1 +
>  include/linux/module_signature.h         |  1 +
>  include/linux/verification.h             |  4 ++
>  kernel/module-internal.h                 |  2 -
>  kernel/module.c                          | 12 +++--
>  kernel/module_signature.c                | 56 +++++++++++++++++++++++-
>  kernel/module_signing.c                  | 33 +++++++-------
>  security/integrity/ima/ima_modsig.c      | 22 ++--------
>  11 files changed, 113 insertions(+), 85 deletions(-)
> 
> -- 
> 2.31.1
> 
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
> 

