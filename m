Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D23742B6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 19:44:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CtFw1qkv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CtFw1qkv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsQmr19Ftz3bnv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 03:44:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CtFw1qkv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CtFw1qkv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsQlt6Z5Fz3bTS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 03:43:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688060598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EuVtH4//9ixVPbYzIxcKCDvS3vv7wF8XPbIE+9o6mxc=;
	b=CtFw1qkvvGcrAe9kdC5A1nT0WxMUaZy1aw76F7fwcY3jMd3fSfvr2GDB0lYx3LxqeRWfll
	rbFIMlDQkScOPc6YWaYXrFT6L6k/pfoRLmLySjXAuOJK8jEgD+w3gH5kx7jUHiVDuhqVt5
	//u+mhSGPQZIHjO9pfhPyAEn2kiXx1w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688060598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EuVtH4//9ixVPbYzIxcKCDvS3vv7wF8XPbIE+9o6mxc=;
	b=CtFw1qkvvGcrAe9kdC5A1nT0WxMUaZy1aw76F7fwcY3jMd3fSfvr2GDB0lYx3LxqeRWfll
	rbFIMlDQkScOPc6YWaYXrFT6L6k/pfoRLmLySjXAuOJK8jEgD+w3gH5kx7jUHiVDuhqVt5
	//u+mhSGPQZIHjO9pfhPyAEn2kiXx1w=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-eSVFC8TxPK-9Km7Edj_kQA-1; Thu, 29 Jun 2023 13:43:14 -0400
X-MC-Unique: eSVFC8TxPK-9Km7Edj_kQA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-76240ab6d72so111399685a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 10:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688060594; x=1690652594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuVtH4//9ixVPbYzIxcKCDvS3vv7wF8XPbIE+9o6mxc=;
        b=EQ8eTZPdfNLdZdyr3HAO2ye9reNXFQPVoKyhPMhMqGY77uusk59o0hpNxpzNu9Bklu
         yyzvv/qSuvekDwDX6xCAHCQx0fHFwfHAY8XPN4fRP3YnT3iwT9qYjmTLSPEydwbyv4gF
         dO8/5hjzbu1m6oCdhvjUoqJaKHjU8Zs1i73I60QMBZxPty733ASzMS1hTiY2qGJnsXD+
         MNyiUxwdvPb1IyIunfqXiKrRUI5HmpPmLF97w52u5M/nu4xlBMF2U0pf5bvN27hVA0vq
         PvDERiEyorPtY9A5iZCsMFFuOATBaSeQsGlt9QTu6tjdCqv0OAenqjZ1asD3YeABryu6
         EfFA==
X-Gm-Message-State: AC+VfDw+kbuvbLoC7Qi9+C0xdDBhSxWkRfwjUwSxAz88orKN/eVIIMpv
	MNKudxEWG/LiU3bj6M7VTGTSzp1aaZWu/WlTT88yXO7Pl1Jf8/eX2tn4kRAKJ7Kn20BzSDntzdh
	ABq9qzbfgZC0AN+dD8M+q0tDLEA==
X-Received: by 2002:a05:620a:2983:b0:765:4e03:b136 with SMTP id r3-20020a05620a298300b007654e03b136mr12908475qkp.53.1688060594497;
        Thu, 29 Jun 2023 10:43:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wUvoKtw61bEx8CLR5eCKB4AQLfhTW4aNAJ+TKGlBZC1NadeujK87p+MvIOiYmY7JuI+2Ytg==
X-Received: by 2002:a05:620a:2983:b0:765:4e03:b136 with SMTP id r3-20020a05620a298300b007654e03b136mr12908457qkp.53.1688060594241;
        Thu, 29 Jun 2023 10:43:14 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id h14-20020a05620a10ae00b007670ee46528sm3106075qkk.116.2023.06.29.10.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 10:43:13 -0700 (PDT)
Date: Thu, 29 Jun 2023 10:43:12 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
Message-ID: <baqjq4zvfwte2y5rpsznu26qzapjjzhycydwgir34yvttbzvzq@z3pfby7pdjo7>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
 <87o7lhfmoh.fsf@mail.lhotse>
 <CA0088E4-2851-4AFF-94F8-2A07C5CDA8D8@linux.ibm.com>
 <675a8893-429d-05be-b647-089b249c814c@leemhuis.info>
 <87o7l7oer1.fsf@mail.lhotse>
 <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
 <c53ihvuesmymj2o5jyqz7gw7mvbrxjifmphuuhiux3qjabjnic@wcak4hfb77td>
 <MN0PR12MB6101C50288F6FE99A3DA5D4FE225A@MN0PR12MB6101.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MN0PR12MB6101C50288F6FE99A3DA5D4FE225A@MN0PR12MB6101.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, "jarkko@kernel.org" <jarkko@kernel.org>, Sachin Sant <sachinp@linux.ibm.com>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 29, 2023 at 05:28:58PM +0000, Limonciello, Mario wrote:
> [Public]
> 
> > -----Original Message-----
> > From: Jerry Snitselaar <jsnitsel@redhat.com>
> > Sent: Thursday, June 29, 2023 12:07 PM
> > To: Limonciello, Mario <Mario.Limonciello@amd.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>; Linux regressions mailing list
> > <regressions@lists.linux.dev>; Sachin Sant <sachinp@linux.ibm.com>; open
> > list <linux-kernel@vger.kernel.org>; linuxppc-dev <linuxppc-
> > dev@lists.ozlabs.org>; jarkko@kernel.org; linux-integrity@vger.kernel.org
> > Subject: Re: [6.4-rc6] Crash during a kexec operation
> > (tpm_amd_is_rng_defective)
> >
> > On Thu, Jun 22, 2023 at 09:38:04AM -0500, Limonciello, Mario wrote:
> > >
> > > On 6/22/2023 7:36 AM, Michael Ellerman wrote:
> > > > "Linux regression tracking (Thorsten Leemhuis)"
> > <regressions@leemhuis.info> writes:
> > > > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > > > > for once, to make this easily accessible to everyone.
> > > > >
> > > > > As Linus will likely release 6.4 on this or the following Sunday a quick
> > > > > question: is there any hope this regression might be fixed any time
> > > > > soon?
> > > > No.
> > > >
> > > > I have added the author of the commit to Cc, maybe they can help?
> > > >
> > > > The immediate question is, is it expected for chip->ops to be NULL in
> > > > this path? Obviously on actual AMD systems that isn't the case,
> > > > otherwise the code would crash there. But is the fact that chip->ops is
> > > > NULL a bug in the ibmvtpm driver, or a possibility that has been
> > > > overlooked by the checking code.
> > > >
> > > > cheers
> > >
> > > All that code assumes that the TPM is still functional which
> > > seems not to be the case for your TPM.
> > >
> > > This should fix it:
> > >
> > > diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> > > index 5be91591cb3b..7082b031741e 100644
> > > --- a/drivers/char/tpm/tpm-chip.c
> > > +++ b/drivers/char/tpm/tpm-chip.c
> > > @@ -525,6 +525,9 @@ static bool tpm_amd_is_rng_defective(struct
> > tpm_chip
> > > *chip)
> > >         u64 version;
> > >         int ret;
> > >
> > > +       if (!chip->ops)
> > > +               return false;
> > > +
> > >         if (!(chip->flags & TPM_CHIP_FLAG_TPM2))
> > >                 return false;
> >
> >
> > Should tpm_amd_is_rng_defective compile to nothing on non-x86
> > architectures? This code is all about
> > working around an issue with the AMD fTPM, right?
> >
> 
> That's a good point.  Yes it could and that would also solve this problem.
> 
Or I guess more accurately for non-x86 it should be:

static bool tpm_amd_is_rng_defective(struct tpm_chip *chip)
{
	return false;
}

