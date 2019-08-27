Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF609E581
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 12:14:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hl902DNlzDqTs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 20:14:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SyqCXMBs"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hl6y01nCzDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 20:12:40 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n190so12432286pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 03:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Yr1eSnebxZR1VlflhfgaY4ZCiED5V7dWIckbppnvdAA=;
 b=SyqCXMBsY0O9WH4cq8nTBpWi2H66ZXxW2/2KnZVsqPdUMfyuJ0WDWsJsWbGl6Fj9UJ
 BFKNu5DEr86u3I591C9jujOxOOokzkZNgygsRQzEj6iIorIxS68jWiwCMou5uw0DIl0e
 DI+D5SXVyeRoP9zNW9zL0IltZjzj5Trmrony6QOcwKRyl+ll3FhHXLGnzQHuVX4OZILR
 kQ4HWb6+COjCliF/29V+xhmBl4yGYi/aVD1JdQG8m3PyEwSrWg2zMqCW6qjbsivnWv2e
 BWIN1BAORMVw374f3IvXK1BOjqFQViWEUouiBoC0IuBlm81SxJ5nRo/XAcrEW4RAwBdy
 lSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Yr1eSnebxZR1VlflhfgaY4ZCiED5V7dWIckbppnvdAA=;
 b=V/3skIH6JjKX6hpR3zW0xdIPmZsYXH2JaOGXtB3vHtAGcW8CDVLIbKsVSM6dPY9vj3
 9URMXwgD7fd1PXV2x6PEvKe/Eukhj+EQRzdXCjLBVKAQnTn2p7OD96kT/h2OW/HQ+g+B
 LjI+M0Q+CPGCMUpt69Mxfk8fw7NQHirKltIEMT2Y0M4g6KI2dtZAi0bWi80Bpizgtmly
 X3iViozL0D0qmaavCFQJPmn3EoToLbXVCLgoygyaS2WlgvWfTKcADPevH/rJhD9uvB0Q
 QlYA/eNzBv8UQTUyTgHznQK3d5p1TFj/wuyySKVOI4bz/LyEXlaycPThpS/CkptmFH3H
 6O5w==
X-Gm-Message-State: APjAAAVxtAsIo1z+GyHJpzlDGrBS34R9BMzGpGuaY/GiAe6p5R7oN/3T
 f9jvnV0eIJYABO4Rx5/mW5b2nG8R
X-Google-Smtp-Source: APXvYqxvVZS+XEyuBakPW6ItPPB0j/H0aXsZbZMlNWK99ZM+LFI8ztoouQyeZxGi6p5KkyFJ4dQhig==
X-Received: by 2002:a63:195f:: with SMTP id 31mr20831175pgz.225.1566900758772; 
 Tue, 27 Aug 2019 03:12:38 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id c5sm15245052pfo.175.2019.08.27.03.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 03:12:37 -0700 (PDT)
Date: Tue, 27 Aug 2019 20:12:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: dump kernel log before carrying out fadump or
 kdump
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20190822063156.4000-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20190822063156.4000-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566900704.9t9kb2w5f8.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh Goudar's on August 22, 2019 4:31 pm:
> Die or panic path in system reset handler dumps kernel log to
> nvram, since commit 4388c9b3a6ee ("powerpc: Do not send system
> reset request through the oops path") system reset request is
> not allowed to take die path if fadump or kdump is configured,
> hence we miss dumping kernel log to nvram, call kmsg_dump()
> before carrying out fadump or kdump.
>=20
> Fixes: 4388c9b3a6ee ("powerpc: Do not send system reset request through t=
he oops path")
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

=
