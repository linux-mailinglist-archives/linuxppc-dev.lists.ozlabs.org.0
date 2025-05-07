Return-Path: <linuxppc-dev+bounces-8367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5266AAAD259
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 02:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsbqM0rRRz2ySc;
	Wed,  7 May 2025 10:34:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746578047;
	cv=none; b=ALNb5K9NblSjFIAQIb3B/fdZzmUueu5UdzljFSgqOUIf093Ncz+WgZsJr56iWaUcJIge9AQJ0hvO3PgOqcAA8vmuhxa32fRIsOutdFOEIVeRxd8RpO7PXBcQzb6UvsMuyRJPELRYJtKMVNW+hDmXSGMZ8OMeeOSSNGkHjHaP+TEWlyAO6Dsnf0yi/H0YGsSmo3MyghiAa7IivHory++LNID1PmOswhqjR3N239b8Sbb0zKWTB1I+H89Gn5MTb2QKdXCwGeisEC70p58F8RdN8max5Jm4Z+PONYKQ8tNM9Y8Yubzg5UeUI/LHDFfPW+TX3UJ59GtYeuqGjiE3JzMsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746578047; c=relaxed/relaxed;
	bh=NdPNOq0pjB3xZhqMYIrpIyO5gfG9RcmV+YpxEba+ohY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5zftoXGMjnhFZzxEihmwZZS8DzSkkU3aZK5qUKOLRB5bIuciH5vm7dljPvZ0zfrJKe94eHC/gTAI1MLdAe8YbHgigW6PfrO6Ad2uu32eceDcoLZ+B2pflG6TDR9oODSLcL5D38dXX1NOO8oZYYy5+6D51t3tkzRrbZIC8NFq//VAF6AS0f6ng1rQH0iFX5rDDTsAlK/REz/k6VVBAFCc+6pm3VO7wWeDbC9DFvHIWvKTg0wy9nim3Ne72GpfTqdRU+MXyAsd7FyQ0WYC5zrucitsWEAdOcLnGiivAx7rgsGg2pIs4LeAYfyDOotuNjRJg83glXM4/FGiWMlSfZXZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YHBaxfqe; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YHBaxfqe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsbqK5Vsjz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 10:34:04 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22e45088d6eso19176065ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 May 2025 17:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746578042; x=1747182842; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdPNOq0pjB3xZhqMYIrpIyO5gfG9RcmV+YpxEba+ohY=;
        b=YHBaxfqewaVmG1Px1zRoC6YjaXQ7iPMUnN3X9ihWzcGrnPAV0KJthbiIgKsICGbRl4
         iMZMDIasPUBp+LdxUvLJXInzI36/Uc6bBL/z1qqxTtQgzfWeZLJHjGcB+YOaMGOctg8a
         O5prQRm/LT9s69na+rvCQeDuZbRG2BGQcfU34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746578042; x=1747182842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdPNOq0pjB3xZhqMYIrpIyO5gfG9RcmV+YpxEba+ohY=;
        b=YExinpfgtqiKXMTrE7Xryb7wvE8z+FoG4BEr5vu3D8ejBPr/ZbL0SXt9YtB664j74N
         R+OXPlrHDQiloZ5T/UXKfdzxBQpfMUf/bmARA1L13LE4H4UYqWHx0zEYaGCdsGwVxQhA
         Ok5OMTgZQjBSs7wmXA2l3iN3iUjJe6D+AdWcTWT9Wv7c1EUZXryXt4+d7Fdrn9aK9WDw
         zZYcldk9dtdMrYmAF34d9FF6H5RPHp80J5mxMB1VxwpCdymREI9tdUZ+i5n7yt7p26lf
         Cx2CEStceqxtpMPq5f3xXNvBALLnSr4N4qI8WSmbEBEKmYBofInKz/4+/139lHfsJ+l1
         SbPw==
X-Forwarded-Encrypted: i=1; AJvYcCU+AouK8nPgdMazg6JPhmwln9beQMVXg7giP5cAFf/Sq5WY0BipQpbkrksRvggVI/W8gXijLs6DU1pXCw4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwoB0cRBhmLCkR+6fnZFkyeST0lpV9lYdWSoNwSk8M+s82iTyj+
	HNyl547B0cLHIb+ZPOgCsUZLvCNRMQwcU8Lqb89kyy6CTK8ep38Dj+YOAfADgQ==
X-Gm-Gg: ASbGncsEkMehzM5Jtf7bKwlSh1ADWhFqwOSQwZYkKG6jx1H0hPwGtW5RsnCSvyYRqA+
	wvenK80KvRxCjuf+2DQbW/7TWZ36EKEbmqsm0kPvI7pYIjQ+SN/L6BAETCwO/Kp9qU+UCW3g+au
	7qqgc27SQCLpQ1RQ63vu4Pypiu0aGAKE0iLoYem+d7x3LElmS7X5vzaLCUsEd1OlnmrkNvH6MwD
	n4gsUq6vko3LYx/EmjdM8Ag/0fh0PLkFIxUw8sCLy69HgPq5olLV0EoQ1gEvEZTw9eg23mPNNIX
	XSHr0H4hDXbW53EeFCkhQG5LsWMGFfkqzaxGFKGKmE8=
X-Google-Smtp-Source: AGHT+IEm3hL38ThjzaykrymnEF7K2NaQu8yqxFHrqArTRPBah7mE6MXKbahuZoQJeZDMqvThzSeSIQ==
X-Received: by 2002:a17:902:cf11:b0:224:7a4:b2a with SMTP id d9443c01a7336-22e5ea42257mr19436395ad.11.1746578041903;
        Tue, 06 May 2025 17:34:01 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:761:97e0:917d:ad1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e5bedb84asm6854505ad.88.2025.05.06.17.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:34:01 -0700 (PDT)
Date: Wed, 7 May 2025 09:33:55 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Misbah Anjum N <misanjum@linux.ibm.com>
Cc: Ritesh Harjani <riteshh@linux.ibm.com>, senozhatsky@chromium.org, 
	yosry.ahmed@linux.dev, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, naveen@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG][powerpc] OOPs: Kernel access of bad area during zram swap
 write - kswapd0 crash
Message-ID: <6r6hex7p53bsbaje4u7so7tfsz6jemazerzujzraibiah7eq4b@m5vgjaff2cdz>
References: <89bfdedb74416156423d36d28c5b92e9@linux.ibm.com>
 <87ldrujhr5.fsf@gmail.com>
 <3374b7cf6a68364c389a260d7ec9067f@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3374b7cf6a68364c389a260d7ec9067f@linux.ibm.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On (25/05/06 11:09), Misbah Anjum N wrote:
> I am facing this issue even with the latest kernel: 6.15.0-rc4-g5721cf0b9352
> The suspecting commit is: 44f76413496ec343da0d8292ceecdcabe3e6ec16. The
> commit introduces zs_obj_write() function.
> Link: https://github.com/torvalds/linux/commit/44f76413496ec343da0d8292ceecdcabe3e6ec16

Can you try the following fix
https://lore.kernel.org/linux-mm/20250504110650.2783619-1-senozhatsky@chromium.org

