Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 961A98CE083
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 07:01:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ehhZSRUt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vlt1034H1z889F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 14:51:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ehhZSRUt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vlt0G1YZCz87xs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 14:50:53 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-68194ee2174so374660a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 21:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716526243; x=1717131043; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIptIV19IdFhks5FxO4qOze6Xd4kuAo9MJ+XTfG/tCk=;
        b=ehhZSRUtuX4/3jBrE5SK+kd431xDEfW9zrFyD8slar6FIL0GsF+6+zQjOMS9JiqTJe
         WNcDdqrNKesd7UWZ8ONjuhnGDGYvmlf+TZosytHk0mtQGfgM0Hh9iGQ/nd1fh0qAZ/vG
         eZXnO7Jl9xVbHq+N53VMw3FjGQPq3l5sGRewiSTCK+ftHeuEB7aQj0T5PPe4UklnuOWp
         YS9ZUDoobesR+uejPa42UiOSKsfapzVCC3+LyIh5VuCw09g/1GHlh1MS+J3k25/QpnAr
         mQ1fLoMrroGXL8cr2NvFziP4otaCiKw7W2oQYL2DN16bZNLXyQ5qDWAp4lQpZ/yI0JH1
         NZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716526243; x=1717131043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIptIV19IdFhks5FxO4qOze6Xd4kuAo9MJ+XTfG/tCk=;
        b=Cz1G8btvDjLIy2NlybsYpLYIIXdsGzegsLRlFbknz0hEL+6WV9YzujIRFK4JgXX8Lj
         NzaNuz0jD/laY5GAu3+tBYQQjEDvvEWkE2dUikQXhJ9G0dlOepM+XjXcEZTVBXCzSZu9
         SB6MkO6/R7qG6FTIjzUixzHL4a6bHzpobVTNgUmEv+9liIme5MS7LexlVuI5Ovld0fVQ
         T2PC2ZMiPYFSk4qPYSXJhAsIjVClQadpSxLgT47PqxDi6MBelsc4s0gGjVrx+UXI13LK
         yinUuR2P9gEVmAMwo7tihF4txf6EYPywrnArkeoy1FFfqCa7FtxlIkI2Jh0BYeijetme
         0PBA==
X-Forwarded-Encrypted: i=1; AJvYcCXtgh2ZzUwhvc0rD24GtBlr1F3hFTD5UmnQLc3D3FEudAj16HcWuVYi/fHBCVFCWzjAYeqaku6d6omfkDj8+3B4ZRJNT0Wh547SC1JDCg==
X-Gm-Message-State: AOJu0YwEh5Cw6QVg6nasOkmt+w3YoQrYuAEdp5ERXlSrVuqvGvi1nq7l
	60KYt4nXXWHuoUyOFLQ10wogeyb2xs/U8az/DiTg7mfTSDc3U9zs
X-Google-Smtp-Source: AGHT+IGph2ngJGkIc2ZoYCJl38SlsP/yXGoytXnEgHL9Q+wVYFcQgbKU4AH+MCEZUe8DoMBNd28k3w==
X-Received: by 2002:a17:902:64d7:b0:1f3:3f33:2873 with SMTP id d9443c01a7336-1f4486ed8afmr11797375ad.25.1716526243411;
        Thu, 23 May 2024 21:50:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7ab7fasm4449235ad.81.2024.05.23.21.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 21:50:42 -0700 (PDT)
Date: Thu, 23 May 2024 21:50:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329072441.591471-14-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Mar 29, 2024 at 12:18:28AM -0700, Samuel Holland wrote:
> Now that all previously-supported architectures select
> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
> of the existing list of architectures. It can also take advantage of the
> common kernel-mode FPU API and method of adjusting CFLAGS.
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

With this patch in the mainline kernel, I get the following build error
when trying to build powerpc:ppc32_allmodconfig.

powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o

[ repeated many times ]

The problem is no longer seen after reverting this patch.

Guenter
