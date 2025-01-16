Return-Path: <linuxppc-dev+bounces-5340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5ABA13A8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 14:11:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYjt11rsNz30MZ;
	Fri, 17 Jan 2025 00:11:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737033065;
	cv=none; b=ieQ8GqzlKO0OGdhGrJLtUF3DRJXhf0fXFY80WPc6LIE6sJ/THgcZb9AmrihpIdOqPO5mAzj6q/0iOCvuvWxJXjW2itbvl0hpZzaRqS47eakfnQ1V2rakMYBFM8eiMIsz8aGUKXAzYc1KfKslcnzrWCY9Ueaw67ijbhO6AbLYA0i5ZMvMCz4CX5TGTmpyAYGqYQ+7jO04JYSsV621cSDNO/PJx6o/WFitp2LoCimFYLh43sujSwD2SP+4nzu+BasqWCaogWuNF7xSJYSZfnskRbDbtSLrGdTlvDgxeXaH7x90dFWKs4ekMr3U1uNB5KGC93Nr0+7o5XopGs/pIu6jGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737033065; c=relaxed/relaxed;
	bh=tJE6q01qSH3/mfQ6O3cCJzFIbn2hHMAntoS6R0p7Vw4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=dHJGhw9DUKiNVR6yZkTBP2CyHN5ux7AnY6I2c5VSoqOoGSr6gR5BnYJ76yQ3xwx1FR/pjgISj5aJD1sulYcyqJV4fdRwCoeFZtGf39WFmAWQllFJa0xorEiVKJsdZLv1QyJ/CFPlwUVuTe+tzEG7nXtyjI4eUIQq6KXzpaj6I4w87WFufVCG130fkColFwYQ3xemd+YqqbpnyXL2O5eBXxDEtKamUibK1zqozbQWMuQravbBTHptLvkNqCbZuQLQRARgEUfoCirJlSN0YJjkxWfQ1CyBAtujck7XGTZR4IzFOhvezlceth2htmL6gptZEEr6LLdM+Ns4Xf1B4+bHRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A4TiJe9s; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A4TiJe9s; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A4TiJe9s;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A4TiJe9s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYjsw6kXqz301n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 00:10:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737033053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJE6q01qSH3/mfQ6O3cCJzFIbn2hHMAntoS6R0p7Vw4=;
	b=A4TiJe9sfPfunTqteP/k1LREBcUB4GVLBXnEi+MUQaqgLgCpdDYT5CFovKjUFFvlzFelYp
	hN+WaqFwfvO4Fj0mhrlfOxiC0Bd2Lxm0t5GhRv7MZ/vWxS0FYHKYScD4YQvfy61m70NSUF
	SiIL7Jkpu5xLNMSAWOQXDVrEZpzLXZI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737033053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJE6q01qSH3/mfQ6O3cCJzFIbn2hHMAntoS6R0p7Vw4=;
	b=A4TiJe9sfPfunTqteP/k1LREBcUB4GVLBXnEi+MUQaqgLgCpdDYT5CFovKjUFFvlzFelYp
	hN+WaqFwfvO4Fj0mhrlfOxiC0Bd2Lxm0t5GhRv7MZ/vWxS0FYHKYScD4YQvfy61m70NSUF
	SiIL7Jkpu5xLNMSAWOQXDVrEZpzLXZI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-JCUS48aXM2eE8xbeOvUI9A-1; Thu, 16 Jan 2025 08:10:50 -0500
X-MC-Unique: JCUS48aXM2eE8xbeOvUI9A-1
X-Mimecast-MFC-AGG-ID: JCUS48aXM2eE8xbeOvUI9A
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2161d185f04so13362515ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 05:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737033049; x=1737637849;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJE6q01qSH3/mfQ6O3cCJzFIbn2hHMAntoS6R0p7Vw4=;
        b=MoTuRhkCx1jYwe4UYQ555czsq0ecZOUUBvRtPk5+HZMUfvRGY7+0teosbzkGEBBcNm
         EG+J5wUdVMYDz3eNQ6sxKPZqbI0nq7pFMeqaif4o2ym8f3gN/F1hdWaJIe2eDnYxMehN
         hCjDKsMZVyEAz1WfNAqirFO/b0rQlsy+iKu+aeWLw7Fb6TDWbXikF+bKymTMgOrvPhxQ
         RzakT+3vx8pUR3upV7jviaFOTimojJ9W2qbpATRPx8Or0mDfzqWf1hI4QxPVZsafZGnq
         uaSiXrlLtzoZaxPrZhFz8UvmzXxUxa36oVp0C+qRqM2FXHDcqg3GarGn0Ty6Pg8Cdod/
         goVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzq0q61MO0KZWxFEuE7H/K3RQjwEVeqEKPXqUXoPGdWiQRLvp54WGDHZ39eMcOce5n3wG7fp6X2K5Jr3s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxiNfLPUd05EPYjX2Hr36zZv6I7qh5j5+puEtRrC64tuJ8ojG/
	7MbIdCGMYySIKHBN6jpeuDbvFR8waiwzLFlsWU3wiVBJ/xQ8mdayVbJrv5WV81ZPMCYU2rqeVoy
	1YLRrJbDssNTAzczoZtC/CH/ETPzhHcY6jWBH5UZaRoS6FOoNXDPZywy7DcIop7U=
X-Gm-Gg: ASbGncsaRWHHrtIUi9q5k2yIyVEPmtOtG47/pwWnGfs7YVnvMa13jETbe1T6Lfroon+
	r38HZWI/TkxwyTvLgykew/kbycsh3BoDK+P3KhDxLr9nG8fa/D7twMUaSMkpd7gXEFBSUxyf48A
	zLrANCwZo2pqojPYr3gTPelC1E3dLLIDst306zMfckGt09MHsnMmQHJLoG70k73Aq/zmBDhVerr
	ZttvHGG42OtVM0l1knHy3kpFaXFAnEWlH+Fke44epBrNuCQhQyMtUF1xw0OZPn69T7QXh4GTDt7
	5Ca1f3hnSRI2EDmqe9WiGXtupogn80iXs4SMrUQ=
X-Received: by 2002:a05:6a20:2d22:b0:1e0:d0c8:7100 with SMTP id adf61e73a8af0-1e88d0dfa37mr60732733637.7.1737033049091;
        Thu, 16 Jan 2025 05:10:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUGbKF+ol54jU0b50uVW9b4PehX8H1D/kojXZ6K7dXSPvbGWangj+PbIkDc2rYIOeEmnulwA==
X-Received: by 2002:a05:6a20:2d22:b0:1e0:d0c8:7100 with SMTP id adf61e73a8af0-1e88d0dfa37mr60732683637.7.1737033048617;
        Thu, 16 Jan 2025 05:10:48 -0800 (PST)
Received: from [192.168.1.46] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658c4bsm11140160b3a.100.2025.01.16.05.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 05:10:48 -0800 (PST)
Message-ID: <af77083e-2100-ea2e-ae14-dc5761456fef@redhat.com>
Date: Thu, 16 Jan 2025 08:10:44 -0500
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Petr Mladek <pmladek@suse.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: jikos@kernel.org, mbenes@suse.cz, shuah@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250114143144.164250-1-maddy@linux.ibm.com>
 <Z4jRisgTXOR5-gmv@pathway.suse.cz>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH] selftests: livepatch: handle PRINTK_CALLER in
 check_result()
In-Reply-To: <Z4jRisgTXOR5-gmv@pathway.suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bKy_jGxeKYt0D1XjphB30qewb7FDc1EdXMhYGWQXp0o_1737033049
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 1/16/25 04:29, Petr Mladek wrote:
> On Tue 2025-01-14 20:01:44, Madhavan Srinivasan wrote:
>> Some arch configs (like ppc64) enable CONFIG_PRINTK_CALLER, which
>> adds the caller id as part of the dmesg. Due to this, even though
>> the expected vs observed are same, end testcase results are failed.
> 
> CONFIG_PRINTK_CALLER is not the only culprit. We (SUSE) have it enabled
> as well and the selftests pass without this patch.
> 
> The difference might be in dmesg. It shows the caller only when
> the messages are read via the syslog syscall (-S) option. It should
> not show the caller when the messages are read via /dev/kmsg
> which should be the default.
> 
> I wonder if you define an alias to dmesg which adds the "-S" option
> or if /dev/kmsg is not usable from some reason.
> 

Hi Petr,

To see the thread markers on a RHEL-9.6 machine, I built and installed
the latest dmesg from:

  https://github.com/util-linux/util-linux

and ran Madhavan's tests.  I don't think there was any alias involved:

  $ alias | grep dmesg
  (nothing)

  $ ~/util-linux/dmesg | tail -n1
  [ 4361.322790] [  T98877] % rmmod test_klp_livepatch

From util-linux's 467a5b3192f1 ("dmesg: add caller_id support"):

 The dmesg -S using the old syslog interface supports printing the
 PRINTK_CALLER field but currently standard dmesg does not support
 printing the field if present. There are utilities that use dmesg and
 so it would be optimal if dmesg supported PRINTK_CALLER as well.

does that imply that printing the thread IDs is now a (util-linux's)
dmesg default?

Regards,

-- 
Joe


