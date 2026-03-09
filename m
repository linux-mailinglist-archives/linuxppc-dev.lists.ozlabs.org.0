Return-Path: <linuxppc-dev+bounces-17875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMQ4CABUrmlACQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 06:00:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C58A233CC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 06:00:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTlFk3J4Tz3c9M;
	Mon, 09 Mar 2026 16:00:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773032442;
	cv=none; b=oMrKYy76KyY79i0cz79hPMnwuSOTN17RjrwsrQ68Nrh8yv+UrtaepqsNEG27atchqRmMNAqiWLghG9cHppgYi2a9wdr38FT12KliEki/c5emHoxzQFx/H6Zrn+c3fFJuQtNWhfZ2Y+s5TeUH4XM9Abt8IpZ6OVyuWm6RbUyvzmytPH7z2Z7TJ0rTblYFePfwMH0AA0Q6sDBPInamniM0CatX3LlA0nDsNuob8QBo0tyJMKZB3gJmpY8nOBwYaxNL8SYvNoSNi/erqdFTYQ/Lc9laLVEC1ioTIcYRzLZoR9NRdjJz5QdQO52CoT8XKTu0NAjZPQxxyZGki46Ihli1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773032442; c=relaxed/relaxed;
	bh=cxozLQNSCLncfQGPIISdNaCtaA18du4zEn7iM8F4d3I=;
	h=Date:Message-Id:From:To:Cc:Subject; b=PMHgTsNElnv7cIgm+7lcUKT3SNY2lDQO5zqZ3YIOYdYqdK6m09G/HHBu5fMeNEU8HbyZssA57NLpYTEYu/gg1b7+09UTMBcwJ80lNuBtJVfzNUewrOhFlqa62FUjZTTe9s6cap98v1GzbEeB+39jcyr1cMq4OAt49koFUJbwbobwI9B5E7rO/bm170J0c9BOAnHRgWBjaXmbkREvE8KwGTU7V8OSG/VcbOSQRChdHMxMdHTOW+ByVaA5MTKpvoj/c7xPBQ9QnV+U3cMrbt+Cz56oNu3ixbiVbK8nNsXSiXEvVWC1c3uCqE0LDk+D1Qj+BbLK7+SCLDbcA3lvNgcM6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bn7rsYTo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bn7rsYTo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTlFh61q3z2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 16:00:40 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ae4d919f9bso47023525ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Mar 2026 22:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773032438; x=1773637238; darn=lists.ozlabs.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxozLQNSCLncfQGPIISdNaCtaA18du4zEn7iM8F4d3I=;
        b=bn7rsYTofK6nUDGuaHiZPwXz9HL4FHuZHdN+1wt5EGzpZ0ICOtkwWqwUcMUmP/No0O
         KD81WNm/Sr6ZAgtwnnY65DVNi15MuRR/tD8R+saQp00H/WziBUfvWVPvWPhp4pCWoWrN
         9STHojT15PD1Mzi88gAhei1dNRYwDjLh9wLP+kIH7ucRmihw24ajdzIV9qHaqPous9gk
         vK8uJXC92C7/a3rOY6OWuFkSfdsl3G4qeBYrkQE3jf6QigdYhvWG199LQGqsS6A+uCww
         kBVnCO+4hKcFuSEqJok+rvPm8+S96Fw050swwg1S3gbdpH2UvWklRS0xQ7b0OzSgFy8j
         o2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773032438; x=1773637238;
        h=subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cxozLQNSCLncfQGPIISdNaCtaA18du4zEn7iM8F4d3I=;
        b=ZLu6YdoHVhszKMBlP6y8R5F1Oe/Xjvef0NvVLH+3lYx17C/xkELut1Mzj6w8C844hy
         nRxjzinYgHoFsvgQQYxSaM8uzytVMLUsY36pOxIs+zIpgSGeyC+Oe3spAaR5B6o4vtFt
         FRCEFBSOHBGdz72QJuFVCNHXLV5iaDkINCvvgLFAnic3XMvOIxMXbdK46FXgsi/i8S2S
         Wgd4IgPdqQIjhVCj00MbBqG/ghai95WSgbL0ceBQjUQbhPEvLcjxGD1eU5zdY7WSO96s
         HmGjY3m6u+KXVI+0UFXleW6Exi37X6/P2UMDJLMmrD+ZUQxK+jV2dMqj/tJeCrvpwTJk
         ilEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaGjXKNf993Ps4RG4+H8sQnfUro2EpgMSkrkDl8VGPEpb/ka8IZzWFZgr/kZn5e2BVyrQ9Yh/z1sWTwzE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxHsK9fuqJiyi332AWrvftC2dFQlurSjzaZfohBIoo8FhXa8X0f
	KYVbPujtP1oyZ6zbED8wc5vwAOTyaqm6G2cuFb8WY9jz58//mkMTmeaj
X-Gm-Gg: ATEYQzwZ8wTV48LC6ygnPx1TaXHIPbxZd0Gx2qz5ZbLnT+GJN3M8YHVngJOOEq57Fy2
	W5RViJKXLUuJdIZx9+xqzjb3QwDdZO+Tc6VQGoGMdll8m+FJaomsXEawjVHpIMGegrF9WlrOmST
	9pQKZV3K0iJnbg1yGrhticBcbL0AFkj8LnD6Kq33MZSs5p6TLftFcRuUQCexAhMlspF67n/soQk
	aNJir5OS5G4/7qWsMuiA5v6rjPKa+F5BiqDUPC4vs4BD+4yeJEcUZ2UsTP68YTux3G6Tn55EE3+
	+Cv2MfrWyp5MrNMqttcqpgVUYsM3+aTHFHbedJFXaf4+p6U6nBXcotjPPOkgg5BApvNCHOwxqo4
	e1aX0vrZo5WRlkeP6rNHIYTzDis2iCYzkPRv/XOMGD1xyPLo9GhtKvOTamD7chyYR4VJlyQUae6
	/pFLsuX8C+EqBhuI78b8pWWg==
X-Received: by 2002:a17:903:8cb:b0:2ae:4dce:7e99 with SMTP id d9443c01a7336-2ae8238fa64mr98363155ad.20.1773032437731;
        Sun, 08 Mar 2026 22:00:37 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83eafc64sm130814465ad.40.2026.03.08.22.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:00:37 -0700 (PDT)
Date: Mon, 09 Mar 2026 10:30:31 +0530
Message-Id: <ecltlhqo.ritesh.list@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sayali Patil <sayalip@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, chleroy@kernel.org, riteshh@linux.ibm.com, hbathini@linux.ibm.com, ming.lei@redhat.com, csander@purestorage.com, czhong@redhat.com, venkat88@linux.ibm.com
Subject: Re: [PATCH v4 1/2] powerpc: fix KUAP warning in VMX usercopy path
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list
X-Rspamd-Queue-Id: 9C58A233CC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sayalip@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:sshegde@linux.ibm.com,m:chleroy@kernel.org,m:riteshh@linux.ibm.com,m:hbathini@linux.ibm.com,m:ming.lei@redhat.com,m:csander@purestorage.com,m:czhong@redhat.com,m:venkat88@linux.ibm.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17875-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Sayali Patil <sayalip@linux.ibm.com> writes:

> On powerpc with PREEMPT_FULL or PREEMPT_LAZY and function tracing enabled,
> KUAP warnings can be triggered from the VMX usercopy path under memory
> stress workloads.
>
> KUAP requires that no subfunctions are called once userspace access has
> been enabled. The existing VMX copy implementation violates this
> requirement by invoking enter_vmx_usercopy() from the assembly path after
> userspace access has already been enabled. If preemption occurs
> in this window, the AMR state may not be preserved correctly,
> leading to unexpected userspace access state and resulting in
> KUAP warnings.
>
> Fix this by restructuring the VMX usercopy flow so that VMX selection
> and VMX state management are centralized in raw_copy_tofrom_user(),
> which is invoked by the raw_copy_{to,from,in}_user() wrappers.
>
> The new flow is:
>
>   - raw_copy_{to,from,in}_user() calls raw_copy_tofrom_user()
>   - raw_copy_tofrom_user() decides whether to use the VMX path
>     based on size and CPU capability
>   - Call enter_vmx_usercopy() before enabling userspace access
>   - Enable userspace access as per the copy direction
>     and perform the VMX copy
>   - Disable userspace access as per the copy direction
>   - Call exit_vmx_usercopy()
>   - Fall back to the base copy routine if the VMX copy faults
>
> With this change, the VMX assembly routines no longer perform VMX state
> management or call helper functions; they only implement the
> copy operations.
> The previous feature-section based VMX selection inside
> __copy_tofrom_user_power7() is removed, and a dedicated
> __copy_tofrom_user_power7_vmx() entry point is introduced.
>
> This ensures correct KUAP ordering, avoids subfunction calls
> while KUAP is unlocked, and eliminates the warnings while preserving
> the VMX fast path.
>
> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Closes: https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/
> Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---

Thanks Sayali & Christophe for the help on this. I liked the new
wrappers which removed the code duplication by calling into a common
function call raw_copy_tofrom_user().

The new changes looks good to me too. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


