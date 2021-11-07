Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D01EC447640
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Nov 2021 23:19:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnTFD5C9Yz2yPg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 09:19:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=DKLtpSmb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=DKLtpSmb; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnTDT433Fz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 09:19:03 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id g11so14236612pfv.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Nov 2021 14:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vvhHrDlviXEtiu42f9Ed4TiIZsHPlHHchTgbcPhjOC4=;
 b=DKLtpSmbwJwijOvRDAEnE4ouv7I+PdkspcRptedwiQW+s7ock1jLZ//bfUU3KqVhBO
 bBQUAl9KcJ1Q6mAns3nLRjQIQf8hjG69ijlsXDi7sqJ5OokTU1fTXsCKgltrRRuLpfRp
 92fkj1s+7TZaU7a4cKiYGeze0dqq2qCOcVosc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=vvhHrDlviXEtiu42f9Ed4TiIZsHPlHHchTgbcPhjOC4=;
 b=vjBspCioYMxhECpw184qXcDshL/0IBTE7bq3nG/FWz9Z8686705NPwhUctPl6I1/nE
 HIvzwyPciUDKnkL6aSnPM2onfgNqDcpKSSUKzVmmhAPchDkyZpJFQCWVTgtlV2BnT8+c
 CQHy/KgwKbxXWS6yHbcEFxviGCUaE3bNaT9iEIC81EFnGsSrj4rzpVF8gjOYhs/+DaDr
 J+Y7lbusRwalu4vhKcQGFGvY9k6NAWm7cGXztgk329Wk4j3lFaqB4Ip2hlqhj698Z33/
 AqwrsUNoZ1VqQ0zycq5ZcsaRl2SIai+Qm9X4SQ0hDCpwvmQO1QYAzmKIXGsUNUpzG+Qd
 brcA==
X-Gm-Message-State: AOAM533y8hrT7hGWWl+9dyb2epPq6VhUuyCIimRGVFoPMLxDMTHIHio/
 ng7iuagvcFFtjPLBcHW+0XavBA==
X-Google-Smtp-Source: ABdhPJxfFXdXIw4YX3AftpaKpLmcq1g8ANa0foPZPl3tIwJBZSTL0sL86tkEOb1z5QnEzVlr5Hl6Bw==
X-Received: by 2002:a05:6a00:8c4:b0:44c:9827:16cc with SMTP id
 s4-20020a056a0008c400b0044c982716ccmr76290901pfu.7.1636323540309; 
 Sun, 07 Nov 2021 14:19:00 -0800 (PST)
Received: from localhost ([2001:4479:e000:e400:9243:f22c:33ee:c8cf])
 by smtp.gmail.com with ESMTPSA id d17sm13127106pfo.40.2021.11.07.14.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 14:18:59 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Mimi Zohar
 <zohar@linux.ibm.com>
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
In-Reply-To: <20211105131401.GL11195@kunlun.suse.cz>
References: <cover.1635948742.git.msuchanek@suse.de>
 <87czneeurr.fsf@dja-thinkpad.axtens.net>
 <20211105131401.GL11195@kunlun.suse.cz>
Date: Mon, 08 Nov 2021 09:18:56 +1100
Message-ID: <87a6ifehin.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank van der Linden <fllinden@amazon.com>,
 Jessica Yu <jeyu@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:

> On Fri, Nov 05, 2021 at 09:55:52PM +1100, Daniel Axtens wrote:
>> Michal Suchanek <msuchanek@suse.de> writes:
>>=20
>> > S390 uses appended signature for kernel but implements the check
>> > separately from module loader.
>> >
>> > Support for secure boot on powerpc with appended signature is planned -
>> > grub patches submitted upstream but not yet merged.
>>=20
>> Power Non-Virtualised / OpenPower already supports secure boot via kexec
>> with signature verification via IMA. I think you have now sent a
>> follow-up series that merges some of the IMA implementation, I just
>> wanted to make sure it was clear that we actually already have support
>
> So is IMA_KEXEC and KEXEC_SIG redundant?
>
> I see some architectures have both. I also see there is a lot of overlap
> between the IMA framework and the KEXEC_SIG and MODULE_SIg.


Mimi would be much better placed than me to answer this.

The limits of my knowledge are basically that signature verification for
modules and kexec kernels can be enforced by IMA policies.

For example a secure booted powerpc kernel with module support will have
the following IMA policy set at the arch level:

"appraise func=3DKEXEC_KERNEL_CHECK appraise_flag=3Dcheck_blacklist apprais=
e_type=3Dimasig|modsig",
(in arch/powerpc/kernel/ima_arch.c)

Module signature enforcement can be set with either IMA (policy like
"appraise func=3DMODULE_CHECK appraise_flag=3Dcheck_blacklist appraise_type=
=3Dimasig|modsig" )
or with CONFIG_MODULE_SIG_FORCE/module.sig_enforce=3D1.

Sometimes this leads to arguably unexpected interactions - for example
commit fa4f3f56ccd2 ("powerpc/ima: Fix secure boot rules in ima arch
policy"), so it might be interesting to see if we can make things easier
to understand.  I suspect another amusing interaction is that if the IMA
verification is used, the signature could be in an xattr rather than an
appended signature.

Kind regards,
Daniel

