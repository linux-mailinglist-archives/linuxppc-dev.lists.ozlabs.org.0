Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C25ABBE10F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 17:19:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dhYS0JsYzDqly
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 01:19:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eghD7xF1"; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhWB1Lz6zDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 01:17:25 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id y23so6069833lje.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rTBq6P5OxsGLjoGVhyAwZM8k0vklyHGTB2oJI82Er7M=;
 b=eghD7xF1O36vsBrF3R1Ol+O9tfU+0jO9JXTPAGDQj/eD9TEB4fS0VQFijoygPStgr3
 10lJjOrWc1bicRYqBtncYZdXUVZQzGo/mCRUFcwwwv+kexKbN1ES5l5Ac30Iyy/VSy6b
 zUdkmBZi6iQtLRd1ksj9hb1AR/76sVMVefmq8BgklCKkDi+tVqaxFM4AvBWSG3sKDCRC
 NPA4lDaeoCpS8CsgLxRZg802nWrQPQecGCdXqYctiynPyMIAzYncAW7BXnLuqZdmqiq7
 lmNY1mZLDVoPD5SAcNNPdqQCcypDkXcAg+PaiFPMbfZqC2X+xM6M1pHyx+WOo3XdPYs0
 eCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTBq6P5OxsGLjoGVhyAwZM8k0vklyHGTB2oJI82Er7M=;
 b=F8Wf9BIUt+7SZ4zWiFvkwxPc1pbDIOA2GygRuQo31sjjqotegqcDs5UWRC2p9i3y3n
 fjUKawvLIKNSvrnWSyQRzF2I3Yzw4pfHLdjE5R5h8sGuNT6QY67OJLsOsx9c/V1nTLL/
 wyvBnLYlBZJa5o/9c7ntRHVs1aG4RM9rWn4pZ9t6P3J7x63TJjZDGsSHk21DiGnRc5t9
 /jqauj0BpoidZwMPPzP9vv+FjkPn3MA/wDLckB22/xxr7E1fMib5bpPUJpRM1/hWsqVN
 pCa+O7nWw8kA+mTBp3UKBswl79a5wqvg/wdmxXeqzeH6hHGh8ACbIEitKZmRk04DMLVN
 tlCA==
X-Gm-Message-State: APjAAAU84cP4lF2iZJlTWFDsqk6rfxHNVZ/7GR+7lFIlgvU5ZkxANPEu
 xNV7UzXXwX1NvPIq8JSZoHxxFLntz8a4ixiR+Oc=
X-Google-Smtp-Source: APXvYqzF1RqhBAB47TPrTDl3zKUBxVzKbXcvNvcrU2oxqh5sJKOV3USfSG9GeeJJkpUMrG8FnoJZki1WHtkUnydqfw8=
X-Received: by 2002:a2e:b0f4:: with SMTP id h20mr1893730ljl.10.1569424639817; 
 Wed, 25 Sep 2019 08:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
In-Reply-To: <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Sep 2019 12:17:28 -0300
Message-ID: <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
To: Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Chris Healy <cphealy@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 25, 2019 at 9:17 AM Adam Ford <aford173@gmail.com> wrote:

> I tried cma=256M and noticed the cma dump at the beginning didn't
> change.  Do we need to setup a reserved-memory node like
> imx6ul-ccimx6ulsom.dtsi did?

I don't think so.

Were you able to identify what was the exact commit that caused such regression?
