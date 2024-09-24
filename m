Return-Path: <linuxppc-dev+bounces-1537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE3C983B65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 04:56:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCPdg6Ll4z2xpk;
	Tue, 24 Sep 2024 12:56:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727146599;
	cv=none; b=YYPpyXTBdSYEu17PdmZm6oDtNGLAChJ8rGGUZh5NajrGyRpZb4SiVUTMhzufytlMwGeHmHEambIM7z01RaxgLFykUuqBXfuxpnLmQHpgERAs9F9lJQibTMqys3/4RJlB8HcjaEX/gvKChB+7UeQKDVaZAyDdmH4gw7fVxsijO+ck/MiEHOGK7BLxOFEDtXHxdXS8EfMqxMAHOwWqECeWLABojoBDHO5hfYaCn/qCXpbxVCppFfXRP3GtQqhlS2uSO1Iz7WAaXRPAx7e4lnpIIsJRE9+RFyv24uMqlLrH2DEQ/uDA1OgC5L1WFLdzBsPoV9mPt/g7VEAhwlyO1lUJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727146599; c=relaxed/relaxed;
	bh=On9oGsvIZfjem73sGq+MqJdM2U+WXxLGXRq4IkAZ4Lo=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=c531ijbFvHXlgw0hWDzjsNxjPqV33fS5VPNSlb/gf16Wtw4/mRKH3ggyqMao3VYGY6cqFTspRbLwfbKom52SGqbr6weWoikDvWMbrgBAGItiJuPqo+z3IIXhUTfjz9GSrHVPga0/kIeplUyrCb6Qkfkp9QEHzQlubvtsMWuica5QDs9wAgROnLxSrtB0xgi3VwUl5riVyhdMq+/6iIIWVMYRd/vIGq3s/0c2aKbdVDReZq6UdmbrivPaoPBnNb2Q9zNcnWl0FmQoB99b8JCn7/tZTMVhrsTe8lRM4WjjHr/6A5qVET1797py06kJvgKL1BTPcQxnBKJVMcOuIXUfbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aoYozNvk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aoYozNvk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCPdf2rpsz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 12:56:37 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7db0fb03df5so3426352a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 19:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727146596; x=1727751396; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=On9oGsvIZfjem73sGq+MqJdM2U+WXxLGXRq4IkAZ4Lo=;
        b=aoYozNvkiuGmJLXuD40UNzKOBSBnZtnfllUjupcbKfXqUN7EEFUPlzY6FyejowbeTw
         JSicX5DbISKCywjvBnJ98Z8A7KmoIDzayRVoAmrq3Iu4nmoGVOf+NCZnx+TiuZXqNpB+
         dBa+1enp+UObgRJf7HF6N3ONHXnVXArdp4t8gnxkY6tpweLlocEfaKVcRcnZQI+NefVd
         OcD27v5QWiO0rDFRXqMtax+hkZ8wexvHtjSMRB+nZXxkW0VfzHRL53ubXSMCXwoBgzPs
         GyJeJED6oXdyX3i8yINULThJ02Vxqkm93Nx+IWWHb7WfvY6I7g5mtesXaeCzJGpEe4AQ
         eH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727146596; x=1727751396;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=On9oGsvIZfjem73sGq+MqJdM2U+WXxLGXRq4IkAZ4Lo=;
        b=Km8ruCmpOGE8EaX5LXsNj/0c8UgJM4tuo7dC6m5aP3xPBRIaHzcYbhmm1MKDR51zkT
         KAroV1rbNSYM5+XYemCPBNCteNI0yr0mEvZASYQp+IAM7CGdusrwOPgcE+VXn+ue2Gsk
         aSSvG6EAZ0sUf/gC6vztqhubb/AftnCVoUsHEeePdqUOYq8+bQpn4w6u/lasTeeJcMge
         WRkayPp9ZhP8LF2yME/phxKctpYOfyexLJugYer00885+zKGZbNAWxAwa2Ew2xFqYS/j
         AbVFe2hCiVrBY5Hht7cM58aqf2utna8NEQrQR8u/tdLqXehaC1RuT0hIObOaJ+zhZFxf
         spVw==
X-Gm-Message-State: AOJu0YwPbHLDdwgG0y5pWpKNRnlVn83v4fYAhP/7lJAGpjqKTL+T3NQH
	Gb5zCB4/XCeSdpfRQRSb+ELSllXkGf4G/0DgvSxtcC5l8xFNoKvX
X-Google-Smtp-Source: AGHT+IGCM/yRJ3B8EHDlCv/yrPfabD25tlj3A/kHgW0/fWrGcWy5BoiszT2hpqv3WpjdbmjtaZnRow==
X-Received: by 2002:a17:90a:fa8f:b0:2d8:53f8:77c0 with SMTP id 98e67ed59e1d1-2dd80c05452mr18655444a91.7.1727146595600;
        Mon, 23 Sep 2024 19:56:35 -0700 (PDT)
Received: from dw-tp ([171.76.82.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e058f6ed30sm348649a91.25.2024.09.23.19.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 19:56:34 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-kernel@vger.kernel.org, mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH v3] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
In-Reply-To: <c474f56f-af74-479d-9db6-fbbfdb287604@roeck-us.net>
Date: Tue, 24 Sep 2024 08:23:18 +0530
Message-ID: <87a5fxbw4h.fsf@gmail.com>
References: <20240909140220.529333-1-nnmlinux@linux.ibm.com> <c474f56f-af74-479d-9db6-fbbfdb287604@roeck-us.net>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> writes:

> Hi,
>
> On Mon, Sep 09, 2024 at 09:02:20AM -0500, Narayana Murty N wrote:
>> VFIO_EEH_PE_INJECT_ERR ioctl is currently failing on pseries
>> due to missing implementation of err_inject eeh_ops for pseries.
>> This patch implements pseries_eeh_err_inject in eeh_ops/pseries
>> eeh_ops. Implements support for injecting MMIO load/store error
>> for testing from user space.
>> 
>> The check on PCI error type (bus type) code is moved to platform
>> code, since the eeh_pe_inject_err can be allowed to more error
>> types depending on platform requirement. Removal of the check for
>> 'type' in eeh_pe_inject_err() doesn't impact PowerNV as
>> pnv_eeh_err_inject() already has an equivalent check in place.
>> 
>> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
>> Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> 
>> ---
>>  arch/powerpc/include/asm/eeh.h               |  2 +-
>>  arch/powerpc/kernel/eeh.c                    |  9 +++--
>>  arch/powerpc/platforms/pseries/eeh_pseries.c | 39 +++++++++++++++++++-
>>  3 files changed, 44 insertions(+), 6 deletions(-)
>> 
>> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
>> index 91a9fd53254f..317b12fc1fe4 100644
>> --- a/arch/powerpc/include/asm/eeh.h
>> +++ b/arch/powerpc/include/asm/eeh.h
>> @@ -308,7 +308,7 @@ int eeh_pe_reset(struct eeh_pe *pe, int option, bool include_passed);
>>  int eeh_pe_configure(struct eeh_pe *pe);
>>  int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
>>  		      unsigned long addr, unsigned long mask);
>> -
>> +int eeh_pe_inject_mmio_error(struct pci_dev *pdev);
>>  /**
>>   * EEH_POSSIBLE_ERROR() -- test for possible MMIO failure.
>>   *
>> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
>> index d03f17987fca..49ab11a287a3 100644
>> --- a/arch/powerpc/kernel/eeh.c
>> +++ b/arch/powerpc/kernel/eeh.c
>> @@ -1537,10 +1537,6 @@ int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
>>  	if (!eeh_ops || !eeh_ops->err_inject)
>>  		return -ENOENT;
>>  
>> -	/* Check on PCI error type */
>> -	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
>> -		return -EINVAL;
>> -
>>  	/* Check on PCI error function */
>>  	if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
>>  		return -EINVAL;
>> @@ -1851,6 +1847,11 @@ static const struct file_operations eeh_dev_break_fops = {
>>  	.read   = eeh_debugfs_dev_usage,
>>  };
>>  
>> +int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
>> +{
>> +	return eeh_debugfs_break_device(pdev);
>> +}
>> +
>
> The new function, as the context suggests, is only compiled if CONFIG_DEBUG_FS=y.
> However, it is called unconditionally. With CONFIG_DEBUG_FS=n, this results in
>
> powerpc64-linux-ld: arch/powerpc/platforms/pseries/eeh_pseries.o: in function `pseries_eeh_err_inject':
> /opt/buildbot/slave/qemu-ppc64/build/arch/powerpc/platforms/pseries/eeh_pseries.c:814:(.text+0x554): undefined reference to `eeh_pe_inject_mmio_error'
> make[3]: *** [/opt/buildbot/slave/qemu-ppc64/build/scripts/Makefile.vmlinux:34: vmlinux] Error 1
> make[2]: *** [/opt/buildbot/slave/qemu-ppc64/build/Makefile:1157: vmlinux] Error 2
>
> I'll enable CONFIG_DEBUG_FS in my tests and won't report this further,
> but you might want to consider fixing the problem at some point.
>

Yes, this is fixed and picked up in powerpc tree.

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=merge&id=3af2e2f68cc6baf0a11f662d30b0bf981f77bfea

-ritesh

