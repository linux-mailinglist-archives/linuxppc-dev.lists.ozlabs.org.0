Return-Path: <linuxppc-dev+bounces-16478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIr3OJ1YfWlDRgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 02:19:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D5BFEF8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 02:19:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2w5Q41mGz3blr;
	Sat, 31 Jan 2026 12:19:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769822362;
	cv=none; b=Y9ozeLBnI9FIDTKhN8GmjXLd6GlC+QnQ+/JhzLUcG2LgKTbREDE7sBHYgd3B8atfotC+hcc2PNP5ODIF6oVZV7iuGBTyo+DwTtcLqWkqM+YQ7eGLga/HTDZ1+JXj1Fokt1QtkpQTKnNNoAuUW1V/4NCcH4MNdR4mZFqPSmEr81voUPRlu+8jnxboD2wRZ6sbsyt6QeS9tkKnhTNRjCN9MXw76koDfyTdzApkZcmR2K3gZ6vsrI8DLbISAlMdW1YTKUpSjZGr0aufFUWRcExVMkGn7axSA+1BBa/ggTWkKN/INB2wiBg89egsDxXXL3LMH7zicm/tfSQ0x9AgJQy0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769822362; c=relaxed/relaxed;
	bh=EPpl6A64UKlYlKR2j1fRkib4LdNnz2WqgktVIjm2uzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3wD6o1CxiHIn7b1g/4vOGg+4Hlc3PUrDfxTPjhqjZYnAM0U3d+vFYprQ/a+O1Msg5M7qFARIe1pufXWeEJyT4trC9lsehJ6cLVW7IhqGS15XRwgRRfOiUdQS9EU7SBLDcAqSMcxGroqKzqwDF86zEpmIXNmCKCFMLK17VTn3p7oSCcY19qmeEDn3huWANHZx7QQPvKZ8Y+J0F/MJRzO+sK8s6hWGNSYtL45RP9L7vbIpH3Hrp/beR1oG2WulT8ir1HqeCYp9xGMCYQUBh0sDo6A1EeMvS7sZe/M1zaf4yX2XHc5HcfQpdwEyRsTInyjTDK8uHVZBKBMHA2Uvds1CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Yp9sWDGD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Yp9sWDGD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2w5N4N9Gz3bkq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 12:19:20 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-385d75e1a79so25326571fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 17:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1769822355; x=1770427155; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EPpl6A64UKlYlKR2j1fRkib4LdNnz2WqgktVIjm2uzU=;
        b=Yp9sWDGDwVb2gYfuRNRAA+72y8HRG7epl3mkT7qeVnEw18tKmfz/HKh4zVHbwRwLEG
         XfWELjPIK65+5pBs5oZk475sus+jt2Fnk9PMhk1QtNH2AESLCALiHCmcWh4JaQZUvDzC
         pD65wlSvI+VPUtmVTO1asb2pm6y7GewTwTp4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769822355; x=1770427155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPpl6A64UKlYlKR2j1fRkib4LdNnz2WqgktVIjm2uzU=;
        b=Uxxrg6LStwArNJkmE6k3O+ER21OeduRvIVaXqiyEXPD31PIM4vHTDTLNL8rUC0z6fy
         uNZIxmOjqeLLXovHRNvpPeF85YoNxVUtmzgwHKtqoB9v+lZLUni2OB42Kfc3jq3bRuJO
         h7Zg1EbuqXFYqQaTIpAIEdHB4ucV5UGgsi4pFnHJuOk0lv9efszTCnBjGUybHCtDr4Qp
         VqqUNUEmtJSCSaokcwrKNzpgPxVL6gEQRTHskIB5jsKiTogga13KFuuvhOJA5riFmzrd
         b19sAJMF8167JO4Xw5CoHXjtj1Hu0hkNlephHomaCvqA4O8dICO1SPUlgq4hrYN1nJdm
         hDUA==
X-Forwarded-Encrypted: i=1; AJvYcCWHa2CERDq2CuoSBz7vBWTH4PeUiQ6j4Cj2saAgQPQ8pKjziayaG0EdWnhWE8nLBFzAxPEg4h2Tdm+wBEg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzgJP7y4U3Ic1D9mAA3yqD0LGfNFJJiihc1fM9vT0OjUdbkvNtR
	X54c4jT44kugijBSuSWqOU7PXzoHjwxMPO6uqVyhif9KjdxcBqIT4YNNPbN2Z7R09ihhrVWBVdQ
	arWkJz/CQoQ==
X-Gm-Gg: AZuq6aK6N+co26UYKR34kQwJvTMwDWF0JUiv7D9ptoX7Z0EL+pfg4GTY5eOM7rVMS5d
	5UyaR+dU1dY9oU7UA8hjyoppHbMhVWfn44CqEgL25DmPNuii5tk1ctP6SLY3dOZAJQ9NuUaWwSq
	UJha/N78bVzaU44ABFMTYc/qCzvJgwCQaBe/6oAneoxtVv9JNe7UkYlTtwgj8naqZRuPGOoLK8f
	6Zq47mwrnlQbqoUUPan+kq75ztXBeinjeSN5gT8QA9fc6sFN6CsjI/yzssFdqiLM7sJbctJJE5N
	VTb8qrkAmrFF9PShhpdhBFD5gN99zsuwCBkP9oBT/3qIYXRPfxSv9UT8kxhHGujVCEydjP3GxQ0
	Olan0OuEq0QQtQJElPxys2UhEg1ZF8Zp3i9bT8uZsPEFR0YOJZYJJODz7DtsqRKDVPvj40iVxy2
	CT32hQUae4NPLpf3uROwq/mJZH6+YcPd3Vq3QVDdexj6gWrqwbC0lJsP/RicPRLJUE
X-Received: by 2002:a05:651c:305a:b0:383:2102:981d with SMTP id 38308e7fff4ca-386466ebf53mr15487501fa.45.1769822354973;
        Fri, 30 Jan 2026 17:19:14 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fa70bcsm19285531fa.38.2026.01.30.17.19.14
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 17:19:14 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-383122fbc9bso22621631fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 17:19:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyVkfCK0CbtEhvHn8KO98lVlnJFw3PUSDHr0d1SjvvtGkxsxnNAdLM0aBf6aAKKMFwaMVP7DDs8P/HQLA=@lists.ozlabs.org
X-Received: by 2002:a05:6402:35c7:b0:658:ba49:96c2 with SMTP id
 4fb4d7f45d1cf-658de54e61dmr2863591a12.6.1769821915767; Fri, 30 Jan 2026
 17:11:55 -0800 (PST)
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
MIME-Version: 1.0
References: <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV> <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
 <20260130235743.GW3183987@ZenIV> <CAHk-=wgk7MRBj4iwQLHocVCa94Jf0cMEz2HzUAS9+6rGtnp4JA@mail.gmail.com>
 <20260131010821.GY3183987@ZenIV>
In-Reply-To: <20260131010821.GY3183987@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Jan 2026 17:11:39 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiXq-bPyKywNOw7z6ehrVReyS-hSPuQkJvuhJWfXGFm=A@mail.gmail.com>
X-Gm-Features: AZwV_QiG_nByRrd83VYAdhaCU5_carsYUlImGLyJR9w-28CTqo3phlyWLRwFL8I
Message-ID: <CAHk-=wiXq-bPyKywNOw7z6ehrVReyS-hSPuQkJvuhJWfXGFm=A@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Samuel Wu <wusamuel@google.com>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-fsdevel@vger.kernel.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:wusamuel@google.com,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-16478-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.org.uk:email,linux-foundation.org:dkim,mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F13D5BFEF8
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 at 17:06, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> I'd rather go for a spinlock there, protecting these FFS_DEACTIVATED
> transitions;

Yes, that's the much better solution.  The locking in this thing is horrendous.

But judging by Samuel's recent email, there's something else than the
open locking thing going on.

          Linus

