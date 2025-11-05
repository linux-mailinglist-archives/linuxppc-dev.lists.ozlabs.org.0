Return-Path: <linuxppc-dev+bounces-13818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ADDC381C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 22:53:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1zbP2J8nz2yFs;
	Thu,  6 Nov 2025 08:53:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762379601;
	cv=none; b=oibthW1HwZ+Py8zcSLjxY1bdZXQ+ex2iyIreWyGyF/9GOToyrEwgXE/65epd6hoPAcOmBbMrOV63XLunB4WgRiFLzuT9znTGyzvfZOmcUoe+Da0gX75JaxJJH+T4/el/VPGIXxWSvklyq2CAd6/4Th5t7s2A0F2sZkF2icj3Wwv5cL8r8P/u6qNnZUV+PE8A1mFCxySaJ95GIQ5yp9caJwdwU4yPfUjRlRvPimNjS8jiBToV6SvldiRwTYPhtzE6Cmt97FMxA7TcXKaYDwBUE6NcmdceKcwKefqJPcCmS9t5ejBsGDVNaCwXy+i5MImBtt1N7jK0IquujYuJROU7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762379601; c=relaxed/relaxed;
	bh=LXYPCL23ES9Iyb1NQ2+5KG+FblnpsKPGwtWMhH2bakQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A847t7+8Sbm9tD85ROfRpdPCRT07fIzoUs6qtK+qnY3yW0jJAteuZOXoy16CherXwfRSKocaczUcPGzZ7Y8iebbW83kzftUfEquJfMpcBLZHSr6l0BBRfLoUWd1zklj/fHan6kVdzJ99E29FelEm0KfdsMpiPV7ohX5WSkYmK1Sdg7i7fIROgTlf9kWGd4q8Mrw9ZMSRHFhM9XGPISKxC+Gi9E1QhMQdFf3wDSoQfVkiEO7Sd6mb+9Jw9c651Jxw8g7DbcfohD74+Wcm2AHzAvPlsVvFRPOII/CCAdGilSTf+QL/COhAdCTt7DT3VXywq+bWI0jjMqysCsUS0ucy0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com; dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=UlPLS24G; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org) smtp.mailfrom=osandov.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=UlPLS24G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1zbM5hKcz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 08:53:18 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-340ef0e6c06so48822a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Nov 2025 13:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1762379595; x=1762984395; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LXYPCL23ES9Iyb1NQ2+5KG+FblnpsKPGwtWMhH2bakQ=;
        b=UlPLS24GvWUTm6NRr0JweoiP4zUVgg5Ar7/0ff4y6HRnkxXZXS8ur+RE1SlKYWmLo9
         Tq3f+3edP5mqpQB3MGiWvDt4Im+CyK1g+rtSjjfEMCFBbxu4EBL0C9MLoEB9MiQpjiuG
         vxnPVTAJxDTXip4X+qHXfD2E7TSz0MjEfMit+zGb/lQfTYPQXUDb4DSAwf0s9JyTu+E3
         dXFf7RE0AnGtftW/mmxglkBNQPOzDpm3H7EYRWNsNeMhBzo40s9aC/YQPHjW29XVkOFn
         MN/K7SlZfKJzkIFZm4rMEVlUVU1t6KsqJQzktNNHJceyde0q1yxinov9quAZ3emUjq+s
         RI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762379595; x=1762984395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXYPCL23ES9Iyb1NQ2+5KG+FblnpsKPGwtWMhH2bakQ=;
        b=xGm+YDMiH3ozNaYjx8H4YlEayjpXBx6rwZd4EGNo8bOskopw6zHejvLY8Ux8ydYnrs
         Ft9VcNAtEpmyGlbMgWovXDnvo89ABHhTtM9s/xnILCf4Rl+zu+bVoZZPKdmFJbMh/Jd4
         j5dKKpvZ+mPraWP24TJaqtvrtIfxRa5JLWa22IV1NYTReW990IBOfEaY2Qz84KZ/JUjh
         WVWNtGe8swz5P5fpKsRCAKZgjeeogwIECad8nyOUCiqjXkN7LH50S+B8buF6u24nfmQ+
         JyNPhRj5m/ptWCk5uVx2CDFF9xH1OtnI/uVuYrsI3t/rHYktICxun0XReFehwskFNT+G
         PTGw==
X-Forwarded-Encrypted: i=1; AJvYcCUCF/L6ekG/sE2FH8AGv1+rbZixmNHE69zJsOlcD2hq+rd+Pq9/rQl3mVj0vPNA24Bcp/+rWNfJYXnrg5U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+b3RAXuB0hV4gp7gonG02XrIU4T3mBWqcgUGhV3ow+V5NPCvx
	6IfnTv8mgcCkfMDnegKRm5rzPpMoveLPK7hhcxxdOioGQnikSZUZX7DFnAG1iQABY1c=
X-Gm-Gg: ASbGncsvQxZun8AM655y9zJmMTk8LQVO5z5A5csyg0JRATEBJ9MEtvDc1vIFbeQMwrt
	F9bLk9RhrH+BE8irR0RAf+ZvyMMTPHfCs3+q3VjoNP7kx/Bi3BiN2gVVn5ZL89kQx+575hlyXjd
	nOwVRVyBajCoEjeLs3+YV63S5uCGhztZDNl20Oncc6aAuaCbs7LkQ8kADE8bdlo2AAhsnFI27zq
	0ubl1rHto/hfVBCkj48py739EiIzTtt+YUG6Ph9poRe+ovJvP74H6sYWI2gx4NUJPlQDH37RMzP
	twZP7sHuPMqWqS1NG3NoBcYXiB18DSIRtYcrEbj8gzR9nb5ZuoZghwf3wsGtVuKhI+YB0VyvjWs
	4u7CuaUeGp4wtPAwtHiYicVDy23PMh3qI3W5GneFND0QEHacxNGSnIHfL/AN3M8Uu7UkQtw==
X-Google-Smtp-Source: AGHT+IGY0r/CwQ4uYP5m9fphBTj5UtPwNG1Wco2SGrHkrgNEwj6b42fgxZjgQDbYi9yCWcOKFr/ugw==
X-Received: by 2002:a17:90b:1811:b0:340:b501:3ae2 with SMTP id 98e67ed59e1d1-341a6b0d5a4mr3477066a91.0.1762379595410;
        Wed, 05 Nov 2025 13:53:15 -0800 (PST)
Received: from telecaster ([2620:10d:c090:500::7:5bbb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d048e1d9sm221963a91.6.2025.11.05.13.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:53:14 -0800 (PST)
Date: Wed, 5 Nov 2025 13:53:13 -0800
From: Omar Sandoval <osandov@osandov.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>,
	linux-kbuild@vger.kernel.org, Samir M <samir@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-debuggers@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Alexey Gladkov <legion@kernel.org>
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <aQvHSVXbOdiN_J5D@telecaster>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
 <aQpCE_XTU-bZHFbk@telecaster>
 <CANBHLUhJ5UVsN4-JN2PG=jq63yGttB9BD6Qm8MgvYirTvg_stw@mail.gmail.com>
 <20251105011548.GB769905@ax162>
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
In-Reply-To: <20251105011548.GB769905@ax162>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 04, 2025 at 06:15:48PM -0700, Nathan Chancellor wrote:
> On Tue, Nov 04, 2025 at 08:35:57PM +0000, Dimitri John Ledkov wrote:
> > On Tue, 4 Nov 2025 at 18:12, Omar Sandoval <osandov@osandov.com> wrote:
> > > drgn's CI hit this same failure. FWIW, the commit fixed by this bisected
> > > commit, 3e86e4d74c04 ("kbuild: keep .modinfo section in
> > > vmlinux.unstripped"), also results in ELF segments of size 0 in vmlinux
> > > for some configurations, which confused drgn until I added a workaround
> > > (https://github.com/osandov/drgn/commit/2a9053de8796af866fd720a3c8c23013595d391a).
> > > So there's some funkiness in this area.
> 
> Omar, could you provide me with a configuration file that reproduces
> this for you? Is there an easy way to check for this situation on the
> command line?

Here's a script that reproduces it:

```
#!/bin/sh

set -e

host_arch=x86_64
compiler_version="12.4.0"

compiler_dir="/tmp/arm64-gcc-$compiler_version"
if [ ! -e "$compiler_dir" ]; then
	rm -rf "$compiler_dir.tmp"
	mkdir "$compiler_dir.tmp"
	curl -L "https://mirrors.kernel.org/pub/tools/crosstool/files/bin/$host_arch/$compiler_version/$host_arch-gcc-$compiler_version-nolibc-aarch64-linux.tar.xz" | tar -C "$compiler_dir.tmp" -Jx
	mv "$compiler_dir.tmp" "$compiler_dir"
fi

export PATH="$compiler_dir/gcc-$compiler_version-nolibc/aarch64-linux/bin:$PATH"
make ARCH=arm64 CROSS_COMPILE=aarch64-linux- tinyconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux- -j$(nproc) vmlinux
readelf -W -l vmlinux | awk '$1 == "LOAD" && $6 ~ /0x0+\>/'
```

It prints something like:

  LOAD           0x1ef008 0x0000000000000000 0xffff800080220000 0x000000 0x000000 R   0x10000

I.e., a segment with FileSiz and MemSiz 0.

Using a newer crosstool version fixes it, so maybe this was a GCC or
binutils bug.

Thanks,
Omar

