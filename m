Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C51E441BF4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 14:49:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjZCB2Yypz2yQ9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 00:49:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zru+uhdg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ghc+uhms;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Zru+uhdg; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ghc+uhms; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjZBP3cdWz2xCc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 00:48:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635774518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUvxJ6sHDgJdM4f4VUnretPE62bc9g1QjZAGZwCNrvA=;
 b=Zru+uhdgc/0iG1XcR4ixhq/z1AxoliwJO4QF0ImjIqJ0wTZ1llQ8shcJ0cP97FpNZEDrKO
 0KL66Fahmnu8lC+awUR6qeStnddxTOxaYjVlQr+pRf/IUkGiZMN4uub9k3Mi7CxaiMk5Ns
 hP++aU27UPN/IDNiR/qB83AON65A4NQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635774519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUvxJ6sHDgJdM4f4VUnretPE62bc9g1QjZAGZwCNrvA=;
 b=ghc+uhmsZ7089dEGBwE9wX8QFQwUdKAvIdZa7TtftqzMYJBHLdbM/zgBoRQS3Rkj/+AA4a
 k6rR8CWXMsXkNqLoyWzUDO/lSk6KLELKzFE8K9hrcXIybx/vO/9lklk35Suf02dhejAtNk
 pajrNlYUP059DEPj+briz6gfIEY21tM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-LC4biY9bNJWEtgttwivZqQ-1; Mon, 01 Nov 2021 09:48:37 -0400
X-MC-Unique: LC4biY9bNJWEtgttwivZqQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 v16-20020a05622a145000b002ac6641f41fso6423672qtx.23
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Nov 2021 06:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fUvxJ6sHDgJdM4f4VUnretPE62bc9g1QjZAGZwCNrvA=;
 b=x34TcmEahlkJezw1kvtYi3mFPkeons6zrGEkt7Z/3HJGED8EFetYNOpoKYIhM4YxX2
 VuSHBKnkdVsG+hdHTInhJOEMUaAaR3V388HobpWjpBaIp0YC97YVbRwt2LFEWhZtCC/X
 62FGqGMS71OnGPcgoy8xQ+QFa6ig6RGmMKp2+qDR9CmeDH4itFecEDxhhKtVUpZczEc1
 ROmp0I2fztleOWu1jAKIkzc5YBuPu02Q3y09Nsr/b3xqC2eKmFCQOFTzWmDpj+9FSIrM
 SstfZmNn/tAEi3H/JqEKqRax3g8iHQ3mmyH94uxcEAW8CaJkxqVEmfT71cK8W0419XF4
 Bgrw==
X-Gm-Message-State: AOAM533WyExRPbHgnp7P3E+JjEJYzcSEtTdm6ZYV3Z4BBkZPWdB1IiD9
 lDP6gFwUdHOY57g4MmB0BCQPtI8SL87tknyg7UqUXvXtyYMTsDaPxsbn/y7puVCd8grRJ/kE+Ww
 8UlyuAv7WnhZbIRhfxNgNUovzng==
X-Received: by 2002:a05:622a:104a:: with SMTP id
 f10mr14545420qte.152.1635774517027; 
 Mon, 01 Nov 2021 06:48:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfUmyxsnDKK0JrXAQRngNQ9XzatuIuwKj9TJR+5paLb5+bXTrgMTuIngwjKknwuhu1LGx+PA==
X-Received: by 2002:a05:622a:104a:: with SMTP id
 f10mr14545389qte.152.1635774516819; 
 Mon, 01 Nov 2021 06:48:36 -0700 (PDT)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net.
 [68.163.101.245])
 by smtp.gmail.com with ESMTPSA id f66sm5529271qkj.76.2021.11.01.06.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 06:48:36 -0700 (PDT)
Subject: Re: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
To: Russell Currey <ruscur@russell.cc>, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <YX9UUBeudSUuJs01@redhat.com>
 <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <f8a96ac1-fda3-92da-cf27-0992a43a2f3f@redhat.com>
Date: Mon, 1 Nov 2021 09:48:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=joe.lawrence@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/1/21 5:20 AM, Russell Currey wrote:
> I'm looking into this now, will update when there's progress.  I
> personally wasn't aware but Jordan flagged this as an issue back in
> August [0].  Are the selftests in the klp-convert tree sufficient for
> testing?  I'm not especially familiar with livepatching & haven't used
> the userspace tools.
> 

Hi Russell, thanks for taking a look.

Testing with that klp-convert tree is probably the quickest and easiest
way to verify the late relocations.

I'm happy to setup and test additional tools (ie, kpatch-build) with any
potential changes as I know they take longer to config and run.

Thanks,

-- 
Joe

