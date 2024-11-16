Return-Path: <linuxppc-dev+bounces-3330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438989CFED2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 13:34:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrCy24HBtz3bWr;
	Sat, 16 Nov 2024 23:34:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731760474;
	cv=none; b=od/4vZyxKretFljWt/VTHqXTZT49uaeufcDIunjph0e8WVg5CE7q7tBE09ebOGKvdUVwM2dehyjgRtmo6G5UJNO1BDL/rJTjHht6xhYUIC+bF5IR0llWcGt6+LVJe09lJrS8zi046BVVCAki5mhfBPO5TbddGpGHL2FmjMf5XfVasiKL+wc/wBK+oMc2xv9V2ZLtupqHX1zQbHwJMJFPRLg4g2av/gSRkrLBA5DX+K/xsGgjEqsXMN/Sloylkk+m6dSZYrmcoaLuuhQhQPmBfLc1kOIT5S+53mL/vZCkfiIFuG/QvVp/4APYhFwY/aNtmWwLkx4fk36QeH2+ULmulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731760474; c=relaxed/relaxed;
	bh=fEtJp9SSOayGK+bhR6rbytlyGbW7N5dlpS26wnCneKg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=AK3v4HvRZFTatuBittZu/j7cce9MghQwJVZ2Gt/UlfqjsZdW7oTuSAPnbA070BKHhyVw/B0JlhMZqnF6CcmE3jXDrTs+Db2RNv/uWeGhrNnzZXHO4zy6m++fpNKIwBwvrUElzjSh6gpCmCv76QDO21Gt+pw7L/JCgS3x5B0D5du5BxA60ulPZ9b/QlVhgKQwqLCvNQ6SF7155HaBj2SSEKdbJ7DbueImbwknnZyPEjKDrk7NCgwD3SP6DSzDqz1X0IhlYsWRM14nuks/bag36Hu9pWSQiXSCIx8SUZYg88yo07spPkRsJgSP/w0kZLrFpJAScqXHqdZZxF7xPpjPOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UdxujRjB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UdxujRjB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrCy01gkSz308V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 23:34:31 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20caea61132so3623225ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 04:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731760467; x=1732365267; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fEtJp9SSOayGK+bhR6rbytlyGbW7N5dlpS26wnCneKg=;
        b=UdxujRjBjH4PcWsPplijYQ6tTI9QjvUS4HN0LHy7ofrSFWeYYJULmYn+31MoX4mMcK
         lsqKSC88Dg021pUHE343xAMqwP0R/w2LzOpOv3XIuBYzcVQqWCpHBYaoeWF0D38scFvG
         130ackII/IJEE0f2QtMD3DnYWuWS/Z4fAIKUmhXq5ZHYr8br3GutJYbypxQof4oWNBNr
         aunVsXa/NgZhau378U6PcZKS1mVr83pKVjaWvRjISXS657mqcXuOqMr3S8WkPxyTrMa6
         E1FHVkR/OeynVRYGCM+BJcBcfqx8mAVHeKfF5eiyPXZAPKcX1p0vDjTQNQrKo/Ru6Y8E
         JR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731760467; x=1732365267;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEtJp9SSOayGK+bhR6rbytlyGbW7N5dlpS26wnCneKg=;
        b=g1Wle/b+xL07okaQ8QPj1LWEdj3WKDaTk91LXz9GCoU4l4XBQbXATCm31qC2+4I9wl
         rzopweeFD7BEaIMokVqex/rDqCqxqr9XHm2B0Y+p8lbR3N6/m0XUm/d26ArkXaDSxJQB
         80WrRjuRDhArNQP90TP3kK3GnVhnFwXlWlqImoCwqf3FnktTmyRxot+0NoR4+YLYisqu
         MjlsR22Lee8AYIYVj0BaJV5UNHuT0hd229tdHKEEfCgJmukDV0fgckR7SLXVrnmOuQgo
         V2oIq/5Eq4Dr4XyA67esmGsCqrAeKy6IrizWqlREWc/xDpT7xo730m5/jqxIyn0+j6JO
         83FA==
X-Forwarded-Encrypted: i=1; AJvYcCU+lTv13MryIP8oD+spn4c8Q/L3wyaPwRX4awTkLY74hvLv1Qq0cBnYtiW+ppJIK69w6fCICar72aTRJb4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8g+wy7V9mCjiYR5OyFHZBi3yfUNvrcD9WneyF0dliDRexaO/l
	U/N4jnvyh0DjPpW/ueLFbdusBsPeB7LE4EKv5ZBzZPnUmGMtqeUF
X-Google-Smtp-Source: AGHT+IGMIdd0MVq9ycS0BwfPAQWlm2CmDCHtZs+52Ag/FtZcI3X0AMiqJ588rNWYIzfyalFel19UQw==
X-Received: by 2002:a17:902:d50a:b0:20c:8331:cb6e with SMTP id d9443c01a7336-211d0d818c6mr91611965ad.19.1731760466885;
        Sat, 16 Nov 2024 04:34:26 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34903sm27031255ad.158.2024.11.16.04.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 04:34:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, brauner@kernel.org
Cc: sforshee@kernel.org, linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mount_setattr: Fix failures on 64K PAGE_SIZE kernels
In-Reply-To: <20241115134114.1219555-1-mpe@ellerman.id.au>
Date: Sat, 16 Nov 2024 17:12:34 +0530
Message-ID: <87o72fcslx.fsf@gmail.com>
References: <20241115134114.1219555-1-mpe@ellerman.id.au>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Michael Ellerman <mpe@ellerman.id.au> writes:

> Currently the mount_setattr_test fails on machines with a 64K PAGE_SIZE,
> with errors such as:
>
>   #  RUN           mount_setattr_idmapped.invalid_fd_negative ...
>   mkfs.ext4: No space left on device while writing out and closing file system
>   # mount_setattr_test.c:1055:invalid_fd_negative:Expected system("mkfs.ext4 -q /mnt/C/ext4.img") (256) == 0 (0)
>   # invalid_fd_negative: Test terminated by assertion
>   #          FAIL  mount_setattr_idmapped.invalid_fd_negative
>   not ok 12 mount_setattr_idmapped.invalid_fd_negative
>
> The code creates a 100,000 byte tmpfs:
>
> 	ASSERT_EQ(mount("testing", "/mnt", "tmpfs", MS_NOATIME | MS_NODEV,
> 			"size=100000,mode=700"), 0);
>
> And then a little later creates a 2MB ext4 filesystem in that tmpfs:
>
> 	ASSERT_EQ(ftruncate(img_fd, 1024 * 2048), 0);
> 	ASSERT_EQ(system("mkfs.ext4 -q /mnt/C/ext4.img"), 0);
>
> At first glance it seems like that should never work, after all 2MB is
> larger than 100,000 bytes. However the filesystem image doesn't actually
> occupy 2MB on "disk" (actually RAM, due to tmpfs). On 4K kernels the
> ext4.img uses ~84KB of actual space (according to du), which just fits.
>
> However on 64K PAGE_SIZE kernels the ext4.img takes at least 256KB,
> which is too large to fit in the tmpfs, hence the errors.

Even though ext4 will use by default 4k blocksize on both kernels but
the backing file here belongs to tmpfs (RAM) which operates at 64k page.
Hence the difference in the size of the image between 4k and 64k kernels
looks expected.

# 64k kernel
du -sh /run/ext4
256K    /run/ext4

# 4k kernel
du -sh /run/ext4
84K     /run/ext4

>
> It seems fraught to rely on the ext4.img taking less space on disk than
> the allocated size, so instead create the tmpfs with a size of 2MB. With
> that all 21 tests pass on 64K PAGE_SIZE kernels.

That looks like the right thing to do here. 

Please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

>
> Fixes: 01eadc8dd96d ("tests: add mount_setattr() selftests")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  tools/testing/selftests/mount_setattr/mount_setattr_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mount_setattr/mount_setattr_test.c b/tools/testing/selftests/mount_setattr/mount_setattr_test.c
> index 68801e1a9ec2..70f65eb320a7 100644
> --- a/tools/testing/selftests/mount_setattr/mount_setattr_test.c
> +++ b/tools/testing/selftests/mount_setattr/mount_setattr_test.c
> @@ -1026,7 +1026,7 @@ FIXTURE_SETUP(mount_setattr_idmapped)
>  			"size=100000,mode=700"), 0);
>  
>  	ASSERT_EQ(mount("testing", "/mnt", "tmpfs", MS_NOATIME | MS_NODEV,
> -			"size=100000,mode=700"), 0);
> +			"size=2m,mode=700"), 0);
>  
>  	ASSERT_EQ(mkdir("/mnt/A", 0777), 0);
>  
> -- 
> 2.47.0

