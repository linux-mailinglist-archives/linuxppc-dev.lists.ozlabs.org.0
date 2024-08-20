Return-Path: <linuxppc-dev+bounces-248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FC1958FB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 23:31:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpN2G26Yxz2yDp;
	Wed, 21 Aug 2024 07:31:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fRh1e7LX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpN2F3Q48z2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 07:31:31 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5bed68129a7so5359379a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 14:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1724189485; x=1724794285; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B/qBbIdE12tBC8jy3M3AIScxm0SURUOtfr0PSYL5bF8=;
        b=fRh1e7LXtHgEDhM/MrTK/J7stBr0Zw58+foYXRInJYrlBa2pRBvxqhKPqPZiZLh0iE
         FIbBMcOd7fV4Ob6RynvFi82Tm8h1Yv6Oj7pku5n6PtwktQKUgKX0XgM3Uwp/esGHRplS
         EO+wGuEze012tpBium8e6/jSGQVtJ47gVIOzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724189485; x=1724794285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/qBbIdE12tBC8jy3M3AIScxm0SURUOtfr0PSYL5bF8=;
        b=jbaOP5Fc9eWFf5LUOwMWxdCZvXBHo2ooOS7ELPSqY5foGELNjuc/TUgy8Mzj6OUWeS
         Q5FP80sY9MoCE+2nuuW6MtxLCd0w9QRBJx0q9Xe8jd+eSYPx+blAnXAIYOXu6GBUFwez
         oIRNzhme2BqiHRxXhulFE29kZ11RN/waCIm6xGKAO5nD8RvE8xosh7OI/2tVPfqlgLTM
         zRmaJl2ubCxfF4nwzrQX1ZX75JErafhNMGn0gXrGv4GSnIr7Ej8fzK3iFw4IXGYLcDIn
         c+ipEdbQ+xuQ5u+KxpwGVlxr9QkNqM7YhNH9NR/Mqu0QlxhhZPITrAvK48umwT98Mf0E
         anlw==
X-Forwarded-Encrypted: i=1; AJvYcCX3NwrFKctkoAkKBDvzIe8EEKBeXA6+4vVKSoORMMcbREwvgaEjUMV174rN40VJkg4uO4b0mcP6kZfJfow=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyW5gBewUN+mnj2He/06PJL2e6jMZmn8v646hyXZSql7ayG56IZ
	FNUM1H3D8K5BxWk0x/R6ITyTNAAlO/LPyUsANsuG8xBNLRAQ/CXSNFm/wM5AOrcD7ro3rPscV5Y
	KiaV8wg==
X-Google-Smtp-Source: AGHT+IFCNn/Y7F4kLaVdJ4RTARNqreIdN5xOv1mczJ6umYvXtfraG6+4JeJ3QrVtEdRoEkKf6yy89Q==
X-Received: by 2002:a17:907:e241:b0:a7a:bae8:f292 with SMTP id a640c23a62f3a-a866f440debmr28457966b.41.1724189484369;
        Tue, 20 Aug 2024 14:31:24 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396c682sm805504166b.196.2024.08.20.14.31.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 14:31:24 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bf0261f162so2596266a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 14:31:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7IlLC/+HEFzJNxr/ZOZpnUOTmhnCkRbVUXocah8M2rIeaRi9+cpv8IQRH4y3eJyHc1rONDfAEs2B+iiQ=@lists.ozlabs.org
X-Received: by 2002:a05:6402:354d:b0:5bf:b29:6eb4 with SMTP id
 4fb4d7f45d1cf-5bf1f164130mr60685a12.21.1724189483542; Tue, 20 Aug 2024
 14:31:23 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240812082605.743814-1-mpe@ellerman.id.au> <20240819185253.GA2333884@thelio-3990X>
 <CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com>
 <20240819195120.GA1113263@thelio-3990X> <CAHk-=wgsDJ+sA1T01YT-z5TXs3zxJ54f0VDApkZ1pgcr8T=myQ@mail.gmail.com>
 <CAHk-=wjzYKrwSDK3PFMC1C2x37aKzEuC7dVxg0kGt8h+vjZfjQ@mail.gmail.com>
 <87y14rso9o.fsf@mail.lhotse> <CAHk-=wiS7PMtL6oR6acNgWZr0NN4Ax4PQD_CYJKCiKS0mT=Z7A@mail.gmail.com>
 <dff57198-7955-ec09-8909-671982834673@landley.net>
In-Reply-To: <dff57198-7955-ec09-8909-671982834673@landley.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 20 Aug 2024 14:31:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj78UV2ep6i5JZ-1qhLPZPHV4eUOtjWqqh_3zcqJ7pK-Q@mail.gmail.com>
Message-ID: <CAHk-=wj78UV2ep6i5JZ-1qhLPZPHV4eUOtjWqqh_3zcqJ7pK-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct vm_special_mapping
To: Rob Landley <rob@landley.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor <nathan@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, jeffxu@google.com, Liam.Howlett@oracle.com, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, linux-um@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon <linux-hexagon@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Aug 2024 at 14:17, Rob Landley <rob@landley.net> wrote:
>
> Hexagon also has &&vdso_page which I don't understand (but have a toolchain for
> somewhere to at least smoketest...)

The '&&' is just a typo. It should obviously be just a single '&'. As
mentioned, the only testing that patch got was a x86-64 UML build
test.

Fixed locally.

               Linus

