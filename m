Return-Path: <linuxppc-dev+bounces-10171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CF0AFFC7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 10:36:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bd7Tq4l5Vz30VZ;
	Thu, 10 Jul 2025 18:35:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752136559;
	cv=none; b=aUG8IppqxC+Plczd8IX8eiXWXss/EB8MJbfIgs7hWqv1HseRKvBCzmGGehTVrjRZ1atHbkqysgDUvymqQXdIpSKR8q9OOmENlcOdTuNFxjo+rv5r9hEJmXgoATbWSZsxZzKZQTDDQf5yT7yIanlG0KaCF5Nvu9du2/m89bu3wqJjnCR1YBRgAaJ2T8BbPYnphDe9WrPzbl1nnMLh52AhiDgyvwXO3X1AG26SjwMviPCwf7kKozqxV2wznQPu3pLL0D/n42kl78zlOPd9R57p+NzxZ2E7ZacgHOH4qgtE1bkeiTQE6FCTiBP0z72gB2eC9ab1PG+oRjCUDmYjTdaRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752136559; c=relaxed/relaxed;
	bh=Xh1mmOkigieJ55IHaZfa8Zg2NGfpNAm2HJHID8wzV98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLng7cye4M+Ozt9HGwSqqNAdXZbG+AnyRIJ+ZYuJ+x0AdwdVCmHrUsxXtZ4u0lZhVxtd/6zJ+pLmz0e65z+5CYGXgi3bnCxZ87kJX/rFkkLszXmat0sj+pQxnLXvY1h/9WHGbhR0Orgh7AdIQx6ytA7/X3FlDNaC96VgjaUXFn0AcyOvGo3ypnGUE3PYmZJ5KnO8qQfyiBbxUoduuaAvcVfwCUDHigXgjSL71zQG9js512F1PGOqHJR+eFGRnB5oyXdwJorBrfUNPdj4D37ygg6Udux64svLnvtfX2FguQs+uTZoy5WYUxIykLRpKcGl44a3HpDHUIB9HJX7dQIXkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IVWMdfXn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=seokwoo.chung130@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IVWMdfXn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=seokwoo.chung130@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bd7Tp2l62z2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 18:35:57 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-235e1d710d8so9906205ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752136555; x=1752741355; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh1mmOkigieJ55IHaZfa8Zg2NGfpNAm2HJHID8wzV98=;
        b=IVWMdfXnqyTtBdnxA/Hm4ibVKVoxjwVdM7ipbebqwuxFUZzpOZePe28crvTj4WaUBx
         rDNt7sM85ebRJgt+SWyXwsNTekZCisMHFfG3IkKY4mrOqnLRDCvJ42RIjlUdraULaFNu
         nOL+78rHlhNl+D4WqpwF95oe4JTVQQODRhUrepz1ANgFTPX1bwKYe6PhIKUV9h+VT/LN
         aYIMBMv13jDrywe9t8+7DkUW19tuq4utBIhQkiYRVb1g2X2kxS0vp2n85LPBt+qao0d7
         iTwwXl1wkPsfcZV1AUkpZYE0G8GKroJ7JhegwZ0AlNRyAdiEJmqzb8B+wMwHbU+4TueM
         EoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752136555; x=1752741355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh1mmOkigieJ55IHaZfa8Zg2NGfpNAm2HJHID8wzV98=;
        b=HzWOO4VH9lnoMnf1uZQcVe971ug2W3T5smUph5spuD9LFLc1W3igtmW82xORBXWriz
         TgA0rIsr5QDIO2eNYt13HYtJB4aK9aubr87iTp72a84QNa0173F80Yv6el1rwexS+ukj
         1FfneXXF14AbShab3rHunpu7LQS8o2o7zArLu8PwCc/do5Gx9L53uJgsLembfjNtOBpz
         Y5l0bVt0TUhTtvT6TTyh6VNanPkk8HUb3or9kZoysuzSVp7NpUkGPiwLFozTKtwU+o45
         pCDKR0AN4KIaazlFOReYk5LH4YqwRe2CrMQMpPfFz8WJXXL0FG218l+p7JRhA3x/iIb5
         pl1w==
X-Forwarded-Encrypted: i=1; AJvYcCXFFrRUruB+AOP9ml7uTktFbBMWllJCtgDpZ0l2hmibNQkiSln3pZqXFn0ptzsO5xWGkSbMbavvgal7Vw8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOvyQIkngH4gVxZMiTBIlZAjGx8PPyxVP0jCbIb/eQ9N/2cXI/
	6tMg03sWphho7vpEA5Vlk5vmhNOejvvjbyZjXPe+MjzmB4dfAhB5iM/F
X-Gm-Gg: ASbGncuhnhKUKzUXOc/X61hG3SB9tBWNn1AqPhNCAwR0iUhXIKmrKIyZ+tJ3Jf+Z+0w
	lTQM3R7MK3hhveQ37dbA6ZlqQHAhgT8bg3eNZBe8hw0rCK8j3H2tXrmPHkPqUwTvTrydJE6nqgQ
	8oH3UFVnHK8PUo9qMBcAIM5dj1BJvgEvMwdQIl9LP7H7PXAb4+pKfTNkHEw01Tl+xzbN3RfDYUQ
	8WpuhynuRsRSdrP3HIDTUd0Np6smU4Y6Mt6mnbVgDcqMynGt8iSxf6mXiO6R5J3Hk/9E0/kxTyq
	XO6yVD2QC6Y+rxt9As8+IzE/TV00MQ6MHVhXlxybRG6nufNrysw9uY4BYz4/LiCWPb5j
X-Google-Smtp-Source: AGHT+IG4B7XXAIAZPOLzQw/263sQj8eeyyiKa3sBlRTmcBCPIqhxXPTBdSpDGcnC8CyHrt0iEV3FXw==
X-Received: by 2002:a17:902:e742:b0:23d:ce98:6110 with SMTP id d9443c01a7336-23ddb199090mr86875705ad.10.1752136555100;
        Thu, 10 Jul 2025 01:35:55 -0700 (PDT)
Received: from gmail.com ([115.137.3.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4289274sm13556225ad.43.2025.07.10.01.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:35:54 -0700 (PDT)
Date: Thu, 10 Jul 2025 17:35:49 +0900
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: fbarrat@linux.ibm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ocxl: sysfs.c: Replace scnprintf() with sysfs_emit()
Message-ID: <aG97Zdc9YU7QFE-j@gmail.com>
References: <20250710071815.351069-1-seokwoo.chung130@gmail.com>
 <8bda71d7c25900616beb706c73a04bd54830252b.camel@linux.ibm.com>
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
In-Reply-To: <8bda71d7c25900616beb706c73a04bd54830252b.camel@linux.ibm.com>
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 10, 2025 at 05:23:12PM +1000, Andrew Donnellan wrote:
> On Thu, 2025-07-10 at 16:18 +0900, Ryan Chung wrote:
> > This change uses sysfs_emit() API usage for sysfs 'show'
> > functions as recommended from Documentation/filesystems/sysfs.rst.
> > Intended for safety and consistency.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
> 
> An identical patch has already been merged in char-misc-next:
> 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20250620024705.11321-1-ankitchauhan2065@gmail.com/
> 
> 
> Andrew
> 
> -- 
> Andrew Donnellan    OzLabs, ADL Canberra
> ajd@linux.ibm.com   IBM Australia Limited

Thank you. I did not see this.

Best, 
Ryan

