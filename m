Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81997641150
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 00:05:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NP7pV2Ft5z3bh2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 10:05:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DSprXLVc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=danielhb413@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DSprXLVc;
	dkim-atps=neutral
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNqp20q7Gz3bNB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 22:04:25 +1100 (AEDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-13bd2aea61bso5292263fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Dec 2022 03:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5Ihg1PETItF3y8znZWvK9wfGxERw93iwuMsHeZdZNc=;
        b=DSprXLVcGK6r+6W/+Erv6tJ4/m+nGVuf14XBSzaX4nw11DPQO+zssI22hPNufLtva6
         y4Yo1zXN/kvAkALIC1l1sD0ucaCILjrZI77TxCFBVtf/8UAlEmxcoTVKCx/cPEaKIY7g
         I8I3GnRgcvqWLxbGi1Vw46IF+dfDeQ/mmh8Z33xS/AaCraXJA70FPLcGJeMtd4woh4DE
         5+1XJUkT4z4eFtkMfveKg8araI8GM8RgnCsr9gNjiLomiU1gnwqXM/aES2Ec749t9+zm
         jAGzq9I2Z8+HOf0va6wi7nWJOST5pbr5jjYrHNOACgmrFDQ/5iAsV/M33GrVJmykUnPG
         D11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5Ihg1PETItF3y8znZWvK9wfGxERw93iwuMsHeZdZNc=;
        b=4wazhm0ZNwpeUftWfyViB+b5YNUGkND5SgTvsBOmU4HUclLCES6iQ+sTZchv5SOhJI
         XTEMqjuurV6UQ5iD9zL+m/lJlA+CRf9Xt9Cs3WJWkGbpGPW+wC/2YxvLDkqXgXAZz2/A
         y1RdUaTsRUMn9KyIOl1gU7z9BiOfNRxd2EexrzzBZHBaexQyi8pyD4qxUMn7I7hV7bSo
         OsKRJiRak5+/TFjIRBex987M7zmZQvUDPOlTIP+18+2fobH0MT45kqZcJ0KwR92/iMT1
         gFfV/xoKOilarfmdhrau7FLFJLK+dTJA36PH+yHiU0lUQkX5jaZHssRSxZ+gTqzx/GN5
         RXNA==
X-Gm-Message-State: ANoB5pnuZvcWl3uL10dLqUz/o7cHZaxe2niPqb5Q6fIgGm906wGZ+YR8
	loayOoKVLx4MBNPj5nYmFiM=
X-Google-Smtp-Source: AA0mqf6DKczaJF+56NMOlq12kM1pOr0J3FUeT7EWvipxmYM0FcAJy6jdSBi6RiwsKyIO8x19trQzrQ==
X-Received: by 2002:a05:6871:430c:b0:143:bd98:2624 with SMTP id lu12-20020a056871430c00b00143bd982624mr12734893oab.165.1669979060481;
        Fri, 02 Dec 2022 03:04:20 -0800 (PST)
Received: from [192.168.68.102] ([177.102.68.131])
        by smtp.gmail.com with ESMTPSA id l4-20020a056870218400b001422f9b5c17sm4014280oae.8.2022.12.02.03.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 03:04:20 -0800 (PST)
Message-ID: <caaa2ef9-d6df-8cf4-0489-1a0dd4623244@gmail.com>
Date: Fri, 2 Dec 2022 08:04:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH] Disable Book-E KVM support?
To: Crystal Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20221128043623.1745708-1-npiggin@gmail.com>
 <3d1a6cde6c8e108be77fa4a47666e14d06a91d74.camel@buserror.net>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <3d1a6cde6c8e108be77fa4a47666e14d06a91d74.camel@buserror.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 03 Dec 2022 10:04:15 +1100
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
Cc: qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>, Cedric Le Goater <clg@kaod.org>, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/30/22 17:45, Crystal Wood wrote:
> On Mon, 2022-11-28 at 14:36 +1000, Nicholas Piggin wrote:
>> BookE KVM is in a deep maintenance state, I'm not sure how much testing
>> it gets. I don't have a test setup, and it does not look like QEMU has
>> any HV architecture enabled. It hasn't been too painful but there are
>> some cases where it causes a bit of problem not being able to test, e.g.,
>>
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-November/251452.html
>>
>> Time to begin removal process, or are there still people using it? I'm
>> happy to to keep making occasional patches to try keep it going if
>> there are people testing upstream. Getting HV support into QEMU would
>> help with long term support, not sure how big of a job that would be.
> 
> Not sure what you mean about QEMU not having e500 HV support?  I don't know if
> it's bitrotted, but it's there.

AFAIK all QEMU ppc boards, aside from pSeries and the Mac ones, are always used in
emulated mode in an use case similar to what Bernhard described in his reply (run
in x86 due to lack of ppc hardware).

I am not aware of e500 KVM support in QEMU since I never attempted it. But yes,
it is present, but poorly tested - if tested at all. And the reason why there's
no push on our side to removed it from QEMU is because its code is so entwined
with pSeries KVM that it would take too much effort.

Do not take the presence of e500 KVM support in QEMU as a blocker to disabled it in
the kernel. As far as the current QEMU usage goes e500 KVM can be removed without
too much drama from our side.


Cedric, do you have any opinions about it?



Daniel


> 
> I don't know whether anyone is still using this, but if they are, it's
> probably e500mc and not e500v2 (which involved a bunch of hacks to get almost-
> sorta-usable performance out of hardware not designed for virtualization).  I
> do see that there have been a few recent patches on QEMU e500 (beyond the
> treewide cleanup type stuff), though I don't know if they're using KVM.  CCing
> them and the QEMU list.
> 
> I have an e6500 I could occasionally test on, if it turns out people do still
> care about this.  Don't count me as the use case, though. :-)
> 
> FWIW, as far as the RECONCILE_IRQ_STATE issue, that used to be done in
> kvmppc_handle_exit(), but was moved in commit 9bd880a2c882 to be "cleaner and
> faster". :-P
> 
> -Crystal
> 
> 
