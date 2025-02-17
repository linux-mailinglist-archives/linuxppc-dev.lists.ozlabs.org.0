Return-Path: <linuxppc-dev+bounces-6239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4CCA37A46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 05:03:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx8Br3q1jz2yys;
	Mon, 17 Feb 2025 15:03:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739761253;
	cv=none; b=lJZ+U8ZPlNV3jrByIh2HJnKoB1OXY9gNOL02mhm4LlhujKBJMVGF+C8yrqg5UZQiXK4mONSekII0DbFqARZB+ZiqRhVL+GyJt+X4keeO7oduHeLVYbmUnh4p7wv56gOlmyu9EmrRJpqUrjPEa6tk1fpi27NDY7Gd34ugHOc0UAzWGBSKT9O8zgwVGuSlrxspe08cJo/egQaLXGWiVaeXuqILAh8GPu3bzDDLqrksZX9QeIPNpm2DmvLeo+33efQQLkvxBzIYZ33WCbwnFPeeZInVGobKLvdKWzIkd7MmRukLHKz4ZEJPq4NqwF2Ptb6Nra6ItqxpmYyWD/EwEpdA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739761253; c=relaxed/relaxed;
	bh=RM9oXdBZNW/iQqyTSg1FXsRacwBHB2wVEo55z428eLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JM1o7u1tWNgBz28WCv7w4JaDBVsnHkDaBx1ox7Kp5e88d8GIpMQlFcoWkqgU3F7dpCrzNzKXRwhc1ULWHygLVJ1rLOj+laSrKY3IG9GzMTqthWWPlaO2Pm72Ce3psYQY3+iR4B1YVd5Q5xXztYfYgnUWF8Y9Y9zTaLoQE9rJX21O/fHn2BQQ2D7YZKBCkJswzbDmwPv0aPZ/X16owubr+gQcF8rCl3q7zuNq4Eo7EKM5W55HjRHEilSbVs0G6ffn4t5QPiBmCxp8DZkmQbC04IBH/MWd8wlpjVlvMmWBu5iz2lUIhbLTJbhL7kbfUowMXakeUQZHTl24w7T7J/nkwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EAP7NY3b; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=liuhangbin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EAP7NY3b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=liuhangbin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx6q82QxCz2yyC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 14:00:51 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2fa5af6d743so5838447a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2025 19:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739761249; x=1740366049; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RM9oXdBZNW/iQqyTSg1FXsRacwBHB2wVEo55z428eLA=;
        b=EAP7NY3bzX5y0TOCicelahd4tSdA56YBFCOWByxmQv5X/tY1uUR9IVEbAqF7QR/OAK
         xEh+TTsozmJFE/pKmFAQSXtqcY23h204C3bn8Qc0ZcIm/kOH+IwuYIZr9lQT+RxjBFPV
         exRx2/BIbPJOQAWQBxArx9AO+L6XeJyUBNT7wyn/e8dNTK/brT5E/H2seTrFxwn8vEtH
         baW0QLma6vRDubiwsR6OYLbLCv/KVSMfobqXEBHv1WqDFluFEtSpaph6vvOxQcqyzrVI
         42wZTVjDhW/hwa0lxaQqT4hgug4Im9gwW532hbRGgCRttCwir+oQTAg4mvauy4QRlSNI
         V56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739761249; x=1740366049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RM9oXdBZNW/iQqyTSg1FXsRacwBHB2wVEo55z428eLA=;
        b=EBApooLMG0yTjEl3J3XM/TNbrsHxkMR5+Qer27vR+ipswD2CKPZ0fNI3MUmrtY15b4
         Suau+2/juFaYWrYwvBFVaIPfic9SSpFwrupLY3P+/pgFpDo6aDpG7F6JeC/omH0I1p3f
         zybkiD0EU8Z3cl1YxfsP6HxwSq4DOoOMbUotKX/eMdWuIFJV4DwJerUGz4/1T7Kbs9hi
         7VciGDXsYYVSsx1OwWb+hdQWCLrV1kagvVRqegq+BdIXtxtb+NvabjhlfxY5QdHTjDeT
         SyZHqE5FF/sZNOV+Ud33gvcqKAT/EGDNfzg8OeWoFGx8RscYtf8VVvMUjIOkSrxarAbZ
         XsLA==
X-Forwarded-Encrypted: i=1; AJvYcCXZo2rBYEckYW3+kZFqDmBxLiw6m3xU/Vmq52NTOpKBhBbz53QpUNMp0rhIHZGVZVp1W8lxitR590zsR20=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzdG1PymZMdCgBRnsYwqlaVzcHIBe0SHZKJrfIVG78tQLkJoICV
	RT8T+pFU3wjTxtDxnaHevRoVC8V/rDOZVsN6g6CN74HZMfZkhhdy
X-Gm-Gg: ASbGncsA9Op8uvx9FiB2zul1ZnJHCUV7P6cw0mN1eTz7lk9KgOhrYGZMM3dPl8DYYON
	mjn2aWvTXCyREP53j1qF/d+7q3PpfWPQR+eHtSdTV6Hd6uHLvjNpW0obYNcYjrWWcE6W+8wYVcY
	oCgVkEEIIg5A1zA/MYDWfHqgXkyL1MPC6VjB5qXs3qlnqbs4FErQZY/ZQCwGOH96UA/Rj7OBc+0
	Jawr8U1g4avfCoovoY1hddOHnjOLHn9RE6FG1cqlEGLUyxLgyyevr3kFbO3zWK7le5TRcoG9hMh
	SfL+1og/H7RCGMsve0nu
X-Google-Smtp-Source: AGHT+IFlbZXzjTjaiCfw7RWv2kRvgfxitjDjmHfqC8UYJCSB2hhBiRs+ip/IcfoDod4m+VWndDNKwQ==
X-Received: by 2002:a05:6a00:244e:b0:71e:21:d2d8 with SMTP id d2e1a72fcca58-7326179d668mr14480366b3a.7.1739761248651;
        Sun, 16 Feb 2025 19:00:48 -0800 (PST)
Received: from fedora ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73265678abasm3272624b3a.27.2025.02.16.19.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 19:00:47 -0800 (PST)
Date: Mon, 17 Feb 2025 03:00:40 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Aditya Dutt <duttaditya18@gmail.com>, Shuah Khan <shuah@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	cgroups@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests: make shell scripts POSIX-compliant
Message-ID: <Z7KmWNNIsXCnhiax@fedora>
References: <20250216120225.324468-1-duttaditya18@gmail.com>
 <Z7IOR2UNzjy7cQA7@slm.duckdns.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7IOR2UNzjy7cQA7@slm.duckdns.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Feb 16, 2025 at 06:11:51AM -1000, Tejun Heo wrote:
> On Sun, Feb 16, 2025 at 05:32:25PM +0530, Aditya Dutt wrote:
> > Changes include:
> > - Replaced [[ ... ]] with [ ... ]
> > - Replaced == with =
> > - Replaced printf -v with cur=$(printf ...).
> > - Replaced echo -e with printf "%b\n" ...
> > 
> > The above mentioned are Bash/GNU extensions and are not part of POSIX.
> > Using shells like dash or non-GNU coreutils may produce errors.
> > They have been replaced with POSIX-compatible alternatives.
> 
> Maybe just update them to use /bin/bash instead? There haven't been a lot of
> reports of actual breakges and a lot of existing tests are using /bin/bash
> already.

+1

Hangbin

