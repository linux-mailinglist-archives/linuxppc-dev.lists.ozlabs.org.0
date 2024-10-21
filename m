Return-Path: <linuxppc-dev+bounces-2461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3C9A67AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 14:12:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXDhC3SkGz2y3Z;
	Mon, 21 Oct 2024 23:12:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729512731;
	cv=none; b=DAVWnHzvju1HbGHjwYVXj+dTTA0CEznx7h50vk2U0l58WDdkLRHi5uwMd5dtF+07TXV8Hw5OsJyWmvTrXBhsW5omJdr50mVAvSLxZIuAV+pGSEySdMFZlM3cS7aG58F6HutbACRmRcHIvsLSPl7zQQWRnVirfxx3gkrhhlbUf7n8u3uSBCgjA+Y6SxERwJufQnsS0ZiluoVhUsI0YZem5mLFRhSWTLAscoUHDGm0lQN1XzosUFDXkWCpdbt3staZcAOv3mhVPS0AmOUAwwK7KE/2gJ7k9JT360W7xLvqFcm33b+8H7LvH8ZE7WlcQGgbU8gCzq1c6rQiRatSC/AXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729512731; c=relaxed/relaxed;
	bh=xF6/Ic9v6OJ/Y6A3E/2TG5AwOYv4mf/4nXJ6EAwvg4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T2OZQX1jDi/rHcqeyM0le53XUfQjpBcGm++MT3CLCrUz+OqhmIc7LG2xPJlSP3XNOWWWKPKpoF5IIu/56jtJVoDz8fw2yj7rJzmkMXKHT6n1eLYBDAPN9yzjzI+FtkukKX4dMBZ1DNV2rjJm14Wut78utT/PCrsr7y3UaZuMV8CwVx3ihx8uQ7GyL6XYJ546BZJxVZD4t58WpTISV8w1OAz8OeDBw5+ZMQslp5r3AzTRRRkE+58RQxOkPxy7wnzVB7oaW/tbOIOf9T3vCCBGVvfqWs5OW5Gkt000KKSV0Dca4S98bXZs/FL9pb3aPYDSBDqUgFNAKTInX3nC7401Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X9pTxouH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ryotkkr98@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X9pTxouH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ryotkkr98@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXDh95z5yz2xg3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 23:12:09 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e2c6bc4840so3164630a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 05:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729512725; x=1730117525; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF6/Ic9v6OJ/Y6A3E/2TG5AwOYv4mf/4nXJ6EAwvg4o=;
        b=X9pTxouHzHZYOAAh+x1absPXGMrP3KAOBOyCZ/SO+hFsAR+VaD4QLKzwXh23SQ51OD
         njP9oGeQSPfs5qLnxz1pjel7cEZibCEU6F40PEooFIIbIZ+goILXGMVPAly3VBwiQ2Hm
         EO9SHHfbju8xQvC6YvWgq6RMjYxAzz4odWdI20W5rcBGQvaIcgabDD3KI01JsN31UMjh
         zRC4qdviRY6J0LrbmaGmmbuEBXfF9BJLvnsqVFLHwazqos9LfzosuJ9a6rFI/9jEt0TG
         Y3RWxWwbzf83pp4ZMvea9tCikk/crgj7k9cKWnMywcw5ybPGtKkpMqtmLHb/qTWC7dHc
         iElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729512725; x=1730117525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xF6/Ic9v6OJ/Y6A3E/2TG5AwOYv4mf/4nXJ6EAwvg4o=;
        b=Se4qptDdj3dEwtCe46QAyHrszSM3eNu7YN0eRUO9GD294AbPdzplFFImbr/t/o6bll
         Xnep9YQboegjyl7LhL+aQRRWtpv4de/UqdUR66g/wcAzENkJctfs/tE06UgmY72s5rX7
         /jFPvC6y8jCjgBMYU7XbONJ4z0LmFqGp2k3/JI8QiNVOEyUNfhKI+cTDuNfzjcydgfUM
         FcEXLm90OUCURbyQfIDpxwLMDjJmcvCSAMmmgD91kXTyJu0IkmHoe40ZTUs2XgloKrs9
         2nHTgm+HMptCXX/8SwJBT2yBoj9WdKs1f+yFoSfpKTaVP2gKkH8hK/qHTLssGy4ONXTS
         hKNg==
X-Forwarded-Encrypted: i=1; AJvYcCWcda5sM5OuP4CkB4GGOdIvRQextutKk6Jw/DMDDOKoFlGjfbohif/KMtvce4NAkksCTbZe9gTV4VEc9YY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZWyEMNgLKKaujS0GLQZLpnOKmuFefhdo4XuW1CAH/JnfKt6Tm
	DLS3Hv/fgLxVlRaoPQBeD64wfZHgV1YdCly78ix7lpT9AiKA55Kw
X-Google-Smtp-Source: AGHT+IERztfGYJvtlKj55iQq8SK7tQD+rxLE3qOHXPCkCobZKQZqc3te3Y1jB7vqkAQvBSzXe1OIaQ==
X-Received: by 2002:a17:90b:1088:b0:2e2:e769:dffe with SMTP id 98e67ed59e1d1-2e5618da95amr14134329a91.30.1729512724821;
        Mon, 21 Oct 2024 05:12:04 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.local.valinux.co.jp (vagw.valinux.co.jp. [210.128.90.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed7f3sm3538944a91.38.2024.10.21.05.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:12:04 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: john.ogness@linutronix.de
Cc: christophe.leroy@csgroup.eu,
	hbathini@linux.ibm.com,
	leobras.c@gmail.com,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	naveen@kernel.org,
	npiggin@gmail.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com,
	sourabhjain@linux.ibm.com
Subject: Re: [PATCH] powerpc/crash: Allow direct printing on kexec
Date: Mon, 21 Oct 2024 21:11:59 +0900
Message-Id: <20241021121159.331940-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <844j56v75z.fsf@jogness.linutronix.de>
References: <844j56v75z.fsf@jogness.linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi John!

On 2024-10-20, John Ogness <john.ogness@linutronix.de> wrote:
>On 2024-10-20, Ryo Takakura <ryotkkr98@gmail.com> wrote:
>> Let legacy consoles print directly so that we can see messages on kexec, as
>> the commit b6cf8b3f3312 ("printk: add lockless ringbuffer") turned printk
>> ring buffer lockless and there should be no worries panicked CPU 
>> deadlocking writing into ringbuffer after shutting down non-panicked CPU.
>
>It is correct that the ringbuffer is now lockless. But the legacy
>console drivers are not. Allowing them to print directly in panic can
>lead to similar effects that commit af2876b501e4 ("powerpc/crash: Use
>NMI context for printk when starting to crash") was working around.

Oh I see.
I wasn't taking the locks acquired by console drivers into account...
Thanks once again for the feedback!

>Note that although printk is deferred, it is only the printing that is
>deferred. The messages are landing in the ringbuffer immediately. So
>they would be available to kdump and crash kernels.

I also agree to rather skip printing and leave it to kdump and 
crash kernels considering the chance of pointed out risk on panic.

>Rather than removing the deferring, it would be better to convert the
>console you are using to the new NBCON API. Then it would be able to
>print direct and safe during panic. (printk_deferred does not affect
>NBCON consoles.) What console driver are you using that you want to see
>the messages on?

I was working on qemu ppc64 this time but I am usually working on 
Raspberry Pi 4 (mostly for fun and study) which uses either of 
bcm2835-aux-uart or amba-pl011. It would be really nice to see them 
working as nbcon!
I am thinking of taking a look at [0] but If there were any other 
references, I would really like to look into as well.

>John Ogness

Sincerely,
Ryo Takakura

[0] https://lore.kernel.org/lkml/87wn3zsz5x.fsf@jogness.linutronix.de/

