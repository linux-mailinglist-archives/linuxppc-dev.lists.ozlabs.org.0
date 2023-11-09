Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D39777E6244
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 03:36:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQmL15tL9z3cWF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 13:36:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chengzhihao1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 941 seconds by postgrey-1.37 at boromir; Thu, 09 Nov 2023 12:24:34 AEDT
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQkl60HrSz2yVZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 12:24:29 +1100 (AEDT)
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SQkN45Xx2zfb3S;
	Thu,  9 Nov 2023 09:08:04 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 9 Nov 2023 09:07:44 +0800
Subject: Re: [PATCH 02/22] [RESEND^2] jffs2: mark
 __jffs2_dbg_superblock_counts() static
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-3-arnd@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cf3724db-e130-01f2-c41e-f2f1e88fc1a8@huawei.com>
Date: Thu, 9 Nov 2023 09:07:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231108125843.3806765-3-arnd@kernel.org>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 09 Nov 2023 13:36:01 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, linux-bcachefs@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@goog
 le.com>, linux-mips@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ÔÚ 2023/11/8 20:58, Arnd Bergmann Ð´µÀ:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This function is only called locally and does not need to be
> global. Since there is no external prototype, gcc warns about
> the non-static definition:
>
> fs/jffs2/debug.c:160:6: error: no previous prototype for '__jffs2_dbg_superblock_counts' [-Werror=missing-prototypes]
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   fs/jffs2/debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
