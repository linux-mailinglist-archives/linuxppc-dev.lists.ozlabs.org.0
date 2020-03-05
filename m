Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E95A717B205
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 00:03:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YRBH1XCczDqwV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 10:03:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tycho.ws
 (client-ip=2607:f8b0:4864:20::c43; helo=mail-yw1-xc43.google.com;
 envelope-from=tycho@tycho.ws; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tycho.ws
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tycho-ws.20150623.gappssmtp.com
 header.i=@tycho-ws.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aGAWUnq2; dkim-atps=neutral
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YNFS1KlxzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 07:51:04 +1100 (AEDT)
Received: by mail-yw1-xc43.google.com with SMTP id p124so65528ywc.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 12:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho-ws.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+KkcNSGG4PmqcHf5w0J/0EA5pqzwTNlZhZPBmrmp7lc=;
 b=aGAWUnq2cShWMA0rCbiRWuVCWELljpX3PB/FsEKGMOFKDXpvVY26swvU1c83ciEV+C
 vZfZPwlp/g4NcEdLGqpe73q7GJanZJzUj1PqzqD+1q/UbfbPfMtPUcBQqEQ1NG/baZT1
 Eg84AfRliEdTYVakSs34OEyTVaJcEodqXgcX/1DW2HbALNbr9n7Pe4axB/UldwC8oIhb
 e+LE398BVASwZokiGAXu+1GIxRuQENdZmZk6VIDtumHXmAfZsZufuaoMj2sBsHbO/Pb+
 hA0XbxlRv5htq2DMEsIiN1fAac252TMiClDppHPRIbUbRR8B1EbMDYwB0KsRmeF5LX2H
 gJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+KkcNSGG4PmqcHf5w0J/0EA5pqzwTNlZhZPBmrmp7lc=;
 b=ljcaycdRiueticWq8IuTF+RUAH6o0GKo30Y8O/mlBaWzcOXGRztssLfw7PBq+G2X2Q
 Irp/P9WJrRmhWnQDzM0r57DO8uWay59o+CsRj/hHinIbFRmLVM8DtQvQ8eneH8kst07Y
 xUnMibCTSgD175gblngzfIBcqPRXIvVo6r8EXLQMVTo46/J/KLyXhKpEl1uob4tnc1AF
 aNrL9osHksRjOQuzNe1aQxifO1xs2AbYpdYPw3P+u84Je86HporXI7wNbrwZy2iKtwCR
 /UeWivAW7t8RP0slYgATFySmq9Mvm/hkZ1sNbeEep5vJ+iwDki1AAX0wsaVQoRH8oa/S
 Q2QA==
X-Gm-Message-State: ANhLgQ0GATG2hipz+Lzdx/K2CZ4RT1gWWtPoRVjszXlw3LcP8CiFJK37
 vDd5Rei+A/SxGgIFNMB/Mh1/Kw==
X-Google-Smtp-Source: ADFU+vs50RkJRZ4RwwF6XWZXespcdsmaoCqqPgVtO/9DW5s3y9h2GpkJOYvZU+X77or1j5LpSjT7oQ==
X-Received: by 2002:a25:6a45:: with SMTP id f66mr119436ybc.63.1583441461260;
 Thu, 05 Mar 2020 12:51:01 -0800 (PST)
Received: from cisco ([2607:fb90:17d4:133:1002:9a44:e2a2:4464])
 by smtp.gmail.com with ESMTPSA id d203sm10941125ywc.29.2020.03.05.12.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:51:00 -0800 (PST)
Date: Thu, 5 Mar 2020 13:50:54 -0700
From: Tycho Andersen <tycho@tycho.ws>
To: Arvind Sankar <nivedita@alum.mit.edu>
Subject: Re: [PATCH] powerpc/32: Stop printing the virtual memory layout
Message-ID: <20200305205054.GD6506@cisco>
References: <202003021038.8F0369D907@keescook>
 <20200305150837.835083-1-nivedita@alum.mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305150837.835083-1-nivedita@alum.mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 06 Mar 2020 10:00:05 +1100
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
Cc: Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 05, 2020 at 10:08:37AM -0500, Arvind Sankar wrote:
> For security, don't display the kernel's virtual memory layout.
> 
> Kees Cook points out:
> "These have been entirely removed on other architectures, so let's
> just do the same for ia32 and remove it unconditionally."
> 
> 071929dbdd86 ("arm64: Stop printing the virtual memory layout")
> 1c31d4e96b8c ("ARM: 8820/1: mm: Stop printing the virtual memory layout")
> 31833332f798 ("m68k/mm: Stop printing the virtual memory layout")
> fd8d0ca25631 ("parisc: Hide virtual kernel memory layout")
> adb1fe9ae2ee ("mm/page_alloc: Remove kernel address exposure in free_reserved_area()")
> 
> Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>

Acked-by: Tycho Andersen <tycho@tycho.ws>
