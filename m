Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2ED7F0CF4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 08:42:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h2XjvTAP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYfcP05GZz3cRt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 18:42:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h2XjvTAP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=mjguzik@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYfbT63Lmz3cJW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 18:41:56 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32f7abbb8b4so2681550f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 23:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700466106; x=1701070906; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UcnRCn9RBtyZwzYZjL7Mal3df0TOYaoALw3ajoI8ruo=;
        b=h2XjvTAPYGJmE+pSNGl4LAjhlFxtPMRl16C8/C2GbKdc9kOeJGrqdV38sdd7+gNEG5
         bi9L9bSx6jVR7DHMED6mKpoxeAluAi/gjNbg/z5Wr36g8t9SiV0BZTsWn7wg5TdDojAl
         IQOTKvD9XnRUinPMs+RWTYYtkil6E4CP2etvRhOofHx+nY+JYH2HmpbpT1mXksiLckI+
         /L9FW40M4gRUDFeZpTzZ/CutX0eCZqLhl5XGscuddNCM87OcJ249VK9bbSQwLKzhD3wY
         vOrGQueEdtEiRKuTpkUwsFpaTnR24kKWcLQYwewJ7wVmYAE7P/GPlpKqVwg63Qzl9ZKQ
         K3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700466106; x=1701070906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcnRCn9RBtyZwzYZjL7Mal3df0TOYaoALw3ajoI8ruo=;
        b=xUpFiCcwavTnb7lIu1SdkerIe5+VLLtsZScg4bgSheLUYDEq0rC7rexQTs8N4P30J6
         8PraTfh3kSZ5CfvTDuHMuio3ARURll+RomrHBDeP89KFGwLis7yOSac/yEeOwc9mZJOo
         +1QcomGQhTLFaa1+Klga9C+YPeDtcDFWQZUZiIIX8e70Q8aBfwjy2r3SRUCnwkpAScRM
         s6gGRnBUF2GUjZ3VT7M/eoQRTEsf4tttThyeXO9oRILYZIW6hgYsDxXlhfz0h+RmzSY3
         2zY0f/eWVYfGiI770nSWmo59V4xIz/1NvXiz8SJ6M5ftjlqzMWM0z+7RIqW5y+YEJATg
         OGjw==
X-Gm-Message-State: AOJu0Yyi4/YeVEIxTrwGCLIhXArXlBpGP5o2dMTCbDkASGFNigq5Btn1
	GP5xz6XPVldMbCIofriiWz0=
X-Google-Smtp-Source: AGHT+IGLxhKtp3IKpPAJiweTS4UYRDByB4GjdiKC0IaFf2a6rUb8Hh+cAbWkEb3mZscgg4QSavm/EA==
X-Received: by 2002:a5d:48c9:0:b0:331:6ad3:853 with SMTP id p9-20020a5d48c9000000b003316ad30853mr3683767wrs.41.1700466105720;
        Sun, 19 Nov 2023 23:41:45 -0800 (PST)
Received: from f (cst-prg-3-109.cust.vodafone.cz. [46.135.3.109])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d55cd000000b003313426f136sm10142299wrw.39.2023.11.19.23.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:41:45 -0800 (PST)
Date: Mon, 20 Nov 2023 08:41:06 +0100
From: Mateusz Guzik <mjguzik@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Subject: Re: [linus:master] [file]  0ede61d858:  will-it-scale.per_thread_ops
 -2.9% regression
Message-ID: <ZVsNklEgxi5GkIZ/@f>
References: <202311201406.2022ca3f-oliver.sang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202311201406.2022ca3f-oliver.sang@intel.com>
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
Cc: Christian Brauner <brauner@kernel.org>, lkp@intel.com, Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org, intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, fengwei.yin@intel.com, gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, feng.tang@intel.com, ying.huang@intel.com, oe-lkp@lists.linux.dev, bpf@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 20, 2023 at 03:11:31PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a -2.9% regression of will-it-scale.per_thread_ops on:
> 
> 
> commit: 0ede61d8589cc2d93aa78230d74ac58b5b8d0244 ("file: convert to SLAB_TYPESAFE_BY_RCU")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> 93faf426e3cc000c 0ede61d8589cc2d93aa78230d74 
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
[snip]
>      30.90 ±  4%     -20.6       10.35 ±  2%  perf-profile.self.cycles-pp.__fget_light
>       0.00           +26.5       26.48        perf-profile.self.cycles-pp.__get_file_rcu
[snip]

So __fget_light now got a func call.

I don't know if this is worth patching (and benchmarking after), but I
if sorting this out is of interest, triviality below is probably the
easiest way out:

diff --git a/fs/file.c b/fs/file.c
index 5fb0b146e79e..d8d3e18800c4 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -856,14 +856,14 @@ void do_close_on_exec(struct files_struct *files)
 	spin_unlock(&files->file_lock);
 }
 
-static struct file *__get_file_rcu(struct file __rcu **f)
+static __always_inline struct file *__get_file_rcu(struct file __rcu **f)
 {
 	struct file __rcu *file;
 	struct file __rcu *file_reloaded;
 	struct file __rcu *file_reloaded_cmp;
 
 	file = rcu_dereference_raw(*f);
-	if (!file)
+	if (unlikely(!file))
 		return NULL;
 
 	if (unlikely(!atomic_long_inc_not_zero(&file->f_count)))
@@ -891,7 +891,7 @@ static struct file *__get_file_rcu(struct file __rcu **f)
 	 * If the pointers don't match the file has been reallocated by
 	 * SLAB_TYPESAFE_BY_RCU.
 	 */
-	if (file == file_reloaded_cmp)
+	if (likely(file == file_reloaded_cmp))
 		return file_reloaded;
 
 	fput(file);
