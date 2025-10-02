Return-Path: <linuxppc-dev+bounces-12646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35C6BB59A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 01:20:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cd7831rCZz3ckk;
	Fri,  3 Oct 2025 09:20:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759447251;
	cv=none; b=l8xsRCkNX/7KXijNN/D8UytqnSanvrlDZCSNn6RKCkrLs9zhzzjgR9/PRVx+b7Lm4PoohpCmq6h610b/zae7e+ym+Je5JzVX/QM5hWhMkGhnk3ouokimFskizdWnqC/QZsWJvN9emte6vAmKbMERbKrts2bKDIpK1g6oinyAkEVpAI3TYTbuCHKzEh7w0kLy0TDB5N5K7nt54ElwMsKeyGRQ0je07UOC14b1ZleTkpvtEHFYT5hlK6s/Rk9ttQbYuDQ9kv0mDo/oqieSGP9517usFWqdQZHiPSQwJHp/rGrruhPmtVonoqkJ9W+jNXW12z610i4hNewB4/yJ4ULaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759447251; c=relaxed/relaxed;
	bh=gX9KJbRliuDiUhyueXfwx/TklBf4F3VVV79ND/TcypU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=koQFMUVsx9CGzrRXIhvsAblMmpnh7ZfZvb8Ejfk/JewVAdVWPcmZWl6GeWfbQ4osUsTLjfQYd6EgLh9DvKKqs9p7qPYp01n9WTWVuIrp+B2IY3+2Vzb4AxBDcGvIuDtfcmFsFP2B1RtQAx9ABmWkz+eEzQC+hbrPUD0PzvvyLmWBmxXa0T+v6Z939D7RpwKACueeRs0UZKSbOcP2PzT/jryNLEL2nlSqwjSBkp88JFkcgmuK1p2Mw5KVEZBUfURAYNpyDdEt+0uKe6w1zqvVz931Ws4kUJuRv2e84Gi8i/qB1QArw0mS4tGWSowBV+WjwBvxcaOfM+EWfzQlUUt2Ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us; dkim=pass (2048-bit key; unprotected) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ObqBWL/j; dkim-atps=neutral; spf=permerror (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=daniel@gimpelevich.san-francisco.ca.us; receiver=lists.ozlabs.org) smtp.mailfrom=gimpelevich.san-francisco.ca.us
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ObqBWL/j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=gimpelevich.san-francisco.ca.us (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=daniel@gimpelevich.san-francisco.ca.us; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cd78226YRz3ckP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Oct 2025 09:20:48 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7841da939deso1613993b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Oct 2025 16:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com; s=20230601; t=1759447246; x=1760052046; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gX9KJbRliuDiUhyueXfwx/TklBf4F3VVV79ND/TcypU=;
        b=ObqBWL/jjEyVfmr+pnyNoGh4mIZS5DNoUz8qtSd7wqlOIJTouk5xelf44B79idX/Ag
         xB0L+2WyQjOeId+Afe6VFz/j7kIv7LxDQ78pkxovbTGQ+QO3Gv78NoNDo9Uhh1vRjc6/
         3xvV4hgBcYWFdtFm3NL1e73e3ze2s1tztvB6mjNKwdniXZQtPwIEDGcFvzMlVrcu4t13
         mD/dwg266pHAjEZylNAyGb2J7HQ1awkDZnL+0jdP2c790Z1+XfRd1IaGOzqyQmfV9KfX
         ffAxcauofOXyf5jeOet8ctVFINUn0J+kTnKpAIlomDwiF2pQDLY6msdUa02NE7Mtm3ta
         GKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759447246; x=1760052046;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gX9KJbRliuDiUhyueXfwx/TklBf4F3VVV79ND/TcypU=;
        b=cyn9Yqms9hYWWXlE1HSXbw4XKgRM5cczF1cdycVrUlJa1h2J1g7NdZaN9JkomSukw7
         0s6NcSkVxNwJvPT2i0nw8LhvMhLZbzNGHpITSNQHvfQbrOoLOLt2tmDFJj2VqbvEFggf
         lJe/rT4ZLXMHNOq12oXbcqK7kIZORiOH6U1U54d/u6XZZrPSZO9b/acl3Bame7UgD5Ws
         QcVWmmWN8yyw8ifVmqRTNLvHd0SzP9FuuyrfnKD0Cu1Hqei6Cn2zaZeQQpNb1uchr1dV
         QrL7SsWYj1i+wWVhZhZNVCCB7EMDBFibrC5IgiGofqSMW/r7kQMpuPP3yB5+lDRdnQCK
         nUGA==
X-Forwarded-Encrypted: i=1; AJvYcCVZHY+lzk6vwySeqAKhnhLAuboLpeox2wWz1f6te2v4bHZFQaFNJBruV+QBIHW7meAa4zVdmxmuxwFBShY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz8ijqKGBoBDEYFI6NWEDSwr2OB0rsUSYWr4/ZlVWS/xk3OqE/o
	txzR9XG87UPO3HFnGwn70dQUoj48EGmaiiqiwAPxVf9I7j/Yn7G+ft0JVpqM8bGn8w==
X-Gm-Gg: ASbGncszEdMkT71ZjmT7COjSxD1Hv/SqT6eDbacjyGhxr54t8LisiI1EWANt07wNn59
	O4XtavccKuQT+xnG3YkXwkeqcF9DyXJqPLecHBW1l+DRRmhLYmNDzvo8J07XxQr069F7muJO/0H
	vFwUgLG5u6GcOoqM0lpRdPemf97qkM7lz+CZic5Ad3G8eO8Funsmk3zEnI4rIWpOy159hsKzrq/
	C3lnmVoq0XZuETaRR+WO9V3rERXASXrR+yi42HHgYuo8+6sirTdIOYvLEKuKSzqLbVKInTQJ6fo
	7oNJErkmGiXrSunbKCkMxAECKQIukHDMKjqfNF3Oa3mfnbgjbdiwDilR4wtqFfBcpTYnPf4mt9y
	3dj5NF4/kR6ATe4CpoKpUfcKhSdmevoqKFeJT+RHPmRVnT3KEHkJ8QUIhru+c51m6tbN3Q6iefz
	VoPozY8gpwLqQKbnGSiZPOKtp6ZpqukH+BGO3oMXQptUw=
X-Google-Smtp-Source: AGHT+IFxx2TCD6D7jFtBEJ3PbntsdESkjjeH5wij8/VnSkkJDYC5xpM48nDuzXv8UOwcied9Nu59sA==
X-Received: by 2002:a17:90b:17cc:b0:32e:5cba:ae11 with SMTP id 98e67ed59e1d1-339c27859aamr1054843a91.28.1759447246577;
        Thu, 02 Oct 2025 16:20:46 -0700 (PDT)
Received: from ?IPv6:2001:5a8:429d:8700:4825:53c7:1977:212e? ([2001:5a8:429d:8700:4825:53c7:1977:212e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0dddsm5947685a91.18.2025.10.02.16.20.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Oct 2025 16:20:46 -0700 (PDT)
Message-ID: <1759447244.24579.14.camel@chimera>
Subject: Re: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command
 line
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Daniel Walker (danielwa)" <danielwa@cisco.com>, Will Deacon
 <will@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Rob
 Herring <robh@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Pratyush Brahma <quic_pbrahma@quicinc.com>, Tomas Mudrunka
 <tomas.mudrunka@gmail.com>, Sean Anderson <sean.anderson@seco.com>,
 "x86@kernel.org" <x86@kernel.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, Ruslan
 Ruslichenko <rruslich@cisco.com>,  Ruslan Bilovol
 <ruslan.bilovol@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Thu, 02 Oct 2025 16:20:44 -0700
In-Reply-To: <dde17d82-3e56-4b9f-8b6d-dae3d523d44e@intel.com>
References: <20231110013817.2378507-1-danielwa@cisco.com>
	 <20231110013817.2378507-7-danielwa@cisco.com>
	 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com> <aN7n_5oiPjk-dCyJ@goliath>
	 <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com> <aN7vKgcUeQgCFglQ@goliath>
	 <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
	 <1759444692.24579.8.camel@chimera>
	 <dde17d82-3e56-4b9f-8b6d-dae3d523d44e@intel.com>
Disposition-Notification-To: daniel@gimpelevich.san-francisco.ca.us
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-10-02 at 16:10 -0700, Dave Hansen wrote:
> How is the approach to "keep it atomic" working out so far? ;)
> 
> The kernel isn't exactly developed in secret. It's also not hard at all
> to, say, once a week to peek at linux-next and do a lore search (or use
> lei) if anyone is desperately worried about the ~50 lines per
> architecture going out of sync.

With all due respect, the lack of action on this patchset is not at all
due to its scope, but purely due to the throwing-spaghetti-at-the-wall
approach to code review that you yourself just got done pointing out.
Addressing the latter problem would thereby also address the former.


