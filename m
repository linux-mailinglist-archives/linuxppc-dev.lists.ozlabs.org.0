Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EBA1F6210
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 09:17:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jFY93DZRzDqnp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 17:17:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=BzNR0Cl7; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jFLS43NDzDqlL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 17:08:00 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE9A22074B;
 Thu, 11 Jun 2020 07:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591859278;
 bh=F12zLwblUt2M78n5/BBJyYI4TGA+GgI0XrwbXA7Dzgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BzNR0Cl7sujvJ6s5XKZ5bzym0XiWWXDS3jOuDKLBaK5oh5GJ4yebWRY1LV8J06SP6
 /wC8Un/3TV89LmhkpAFIbdeaQb1yPsw52MAwpS5aNST9MZsCsmqI2dok+q/+SAaz7D
 ZgY5UEi/Ky+Bu5m4at16tFrMjqtt/osbrVmxbCs4=
Date: Thu, 11 Jun 2020 08:07:40 +0100
From: Will Deacon <will@kernel.org>
To: Xiaoming Ni <nixiaoming@huawei.com>
Subject: Re: [PATCH v2] All arch: remove system call sys_sysctl
Message-ID: <20200611070739.GA32288@willie-the-truck>
References: <1591847640-124894-1-git-send-email-nixiaoming@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591847640-124894-1-git-send-email-nixiaoming@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 11 Jun 2020 17:15:23 +1000
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
Cc: linux-sh@vger.kernel.org, catalin.marinas@arm.com, paulus@samba.org,
 ak@linux.intel.com, paulburton@kernel.org, geert@linux-m68k.org,
 mattst88@gmail.com, brgerst@gmail.com, acme@kernel.org, cyphar@cyphar.com,
 viro@zeniv.linux.org.uk, luto@kernel.org, tglx@linutronix.de,
 surenb@google.com, rth@twiddle.net, young.liuyang@huawei.com,
 linux-parisc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, jongk@linux-m68k.org,
 linux@dominikbrodowski.net, James.Bottomley@HansenPartnership.com,
 jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
 deller@gmx.de, yzaikin@google.com, mszeredi@redhat.com, gor@linux.ibm.com,
 linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-arm-kernel@lists.infradead.org, chris@zankel.net, tony.luck@intel.com,
 linux-api@vger.kernel.org, zhouyanjie@wanyeetech.com, minchan@kernel.org,
 ebiederm@xmission.com, sargun@sargun.me, alexander.shishkin@linux.intel.com,
 heiko.carstens@de.ibm.com, alex.huangjianhui@huawei.com, krzk@kernel.org,
 borntraeger@de.ibm.com, vbabka@suse.cz, samitolvanen@google.com,
 flameeyes@flameeyes.com, ravi.bangoria@linux.ibm.com, elver@google.com,
 keescook@chromium.org, arnd@arndb.de, bp@alien8.de, christian@brauner.io,
 tsbogend@alpha.franken.de, jiri@mellanox.com, martin.petersen@oracle.com,
 yamada.masahiro@socionext.com, oleg@redhat.com, sudeep.holla@arm.com,
 olof@lixom.net, shawnguo@kernel.org, davem@davemloft.net,
 bauerman@linux.ibm.com, dalias@libc.org, fenghua.yu@intel.com,
 peterz@infradead.org, dhowells@redhat.com, hpa@zytor.com,
 sparclinux@vger.kernel.org, jolsa@redhat.com, svens@stackframe.org,
 x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 naveen.n.rao@linux.vnet.ibm.com, paulmck@kernel.org, sfr@canb.auug.org.au,
 npiggin@gmail.com, namhyung@kernel.org, dvyukov@google.com, axboe@kernel.dk,
 monstr@monstr.eu, haolee.swjtu@gmail.com, linux-mips@vger.kernel.org,
 ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 11, 2020 at 11:54:00AM +0800, Xiaoming Ni wrote:
> Since the commit 61a47c1ad3a4dc ("sysctl: Remove the sysctl system call"),
> sys_sysctl is actually unavailable: any input can only return an error.
> 
> We have been warning about people using the sysctl system call for years
> and believe there are no more users.  Even if there are users of this
> interface if they have not complained or fixed their code by now they
> probably are not going to, so there is no point in warning them any
> longer.
> 
> So completely remove sys_sysctl on all architectures.
> 
> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> 
> changes in v2:
>   According to Kees Cook's suggestion, completely remove sys_sysctl on all arch
>   According to Eric W. Biederman's suggestion, update the commit log
> 
> V1: https://lore.kernel.org/lkml/1591683605-8585-1-git-send-email-nixiaoming@huawei.com/
>   Delete the code of sys_sysctl and return -ENOSYS directly at the function entry
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl             |   2 +-
>  arch/arm/configs/am200epdkit_defconfig             |   1 -
>  arch/arm/tools/syscall.tbl                         |   2 +-
>  arch/arm64/include/asm/unistd32.h                  |   4 +-

For the arm/arm64 parts:

Acked-by: Will Deacon <will@kernel.org>

Will
