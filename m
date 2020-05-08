Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A59C1CA498
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 08:55:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JLgZ0nGHzDqlW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 16:55:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=samsung.com (client-ip=210.118.77.11;
 helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=pzSVIV3/; 
 dkim-atps=neutral
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JLdY3nqkzDqkW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 16:53:33 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200508065328euoutp01c6e48b3218343420fa606763be5d5508~M_w5_Zbte1038110381euoutp01B;
 Fri,  8 May 2020 06:53:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200508065328euoutp01c6e48b3218343420fa606763be5d5508~M_w5_Zbte1038110381euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588920808;
 bh=Z7m45ytXKpkmvuwQpxVLZ3SHLM3cMj1bzkRRhkTnaDw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=pzSVIV3/v4e6lL50pBf9yQgvuF1lvhHNPmqHibxlL4qnnHlOO6Ca0kv2oDyxarTjN
 XhrxPH3lLvQzFvDmw9NPUFKSSTxL3kVHrAUEIe01K54sMLxFlf2tG3i4RZGhacY21r
 A0MDXGqKfAhgnG0tYNBqygHojYiWJ2fPWkwBsF2I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200508065327eucas1p2f725cefdb89745bd1d77d3dfb0ffb3d3~M_w5qPND-1155711557eucas1p2A;
 Fri,  8 May 2020 06:53:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 99.CD.60679.7E105BE5; Fri,  8
 May 2020 07:53:27 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200508065327eucas1p21ec9f6144ed975dc1fa11d99b6dc3ffb~M_w5PabC_1674116741eucas1p2U;
 Fri,  8 May 2020 06:53:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200508065327eusmtrp2d1c70c67a2854b27d77b372c8fb55774~M_w5OM_4x2329423294eusmtrp2-;
 Fri,  8 May 2020 06:53:27 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-8e-5eb501e7ebe1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 65.7B.08375.7E105BE5; Fri,  8
 May 2020 07:53:27 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200508065325eusmtip1a647998be423003f3e0d8a7ff6ef6317~M_w3Sghb12877628776eusmtip1m;
 Fri,  8 May 2020 06:53:25 +0000 (GMT)
Subject: Re: [PATCH v4 02/14] arm: add support for folded p4d page tables
To: Mike Rapoport <rppt@linux.ibm.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <98229ab1-fbf8-0a89-c5d6-270c828799e7@samsung.com>
Date: Fri, 8 May 2020 08:53:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200507161155.GE683243@linux.ibm.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTZxTee+/t7W2z6m1F+8YRlzULyWaQ6TZ3Ehc/4n68Jv7wj4lZAtrp
 DbAVMK04NPtRy0ewwQ9qEbwt4ujinNQ1Fiofs3M2aFFCh9YYUBBlGEXBYq1Tvoptr278e85z
 nnOe5/w4HK15zS7l8gv3CMZCvUHHKpkLVydDmY+QL+eztiNZ4PS4WZi1XZXD+TqPDNrL+xiY
 sJTTEDldhaCylIKfJ6dkUHF8A9Q7bAhm/edZmDkxQcFYdDk8vx6UQ3/gDIKhPw4k5B0vGfD+
 c1sGkbI2FiYqn8kg3OFk4Z57TgbOGTsNgRo/gulX8YSV85oMWswBFqziQxa8B8MsuDtdcuj0
 tFLQZzez4K+5j6DH+1vCrPceA77uCA1lA1/CkM1Prc8g7pNuRMK3b9BkesqGSPmR1ywJHz5E
 kcZRM0OqezJJuzgoJ66LoxSpGiuTEe/ZgyzxRm1yEnJMMKSrbpohRxv/QuRvr5vekv6t8utd
 giF/r2DMWrtDmec/UMbsHlKXVNsXmlHFQitScJj/Ao8MjyErUnIa/gzCF2tdlFTEEHZ3tjBS
 8QLhhw9m2Xcj52ab36p+RXjq5K238xGE4z02KqlaxG/Ch5qvMEmcxmdgy0sxNUHzj5XYPNNF
 JxssvxJbx62ptSp+LX5ku5TgOY7hP8Z+z/4kvZjPxt2uZiRJ1PjaiZHUTkUiRX3NqxRP8x/i
 Up+DlrAW3xlpoKSkNxU4fnqZhL/BYcccI+FF+EmwRS7hdDzX3pDKhvlShB+EzsmlogrhsKUO
 Sao1eCA0xSbD0fwn2NORJdEbcG2klUrSmF+A+8bVUoYF2HahlpZoFa6s0EjqDCwGf//P9nLv
 Tfoo0onzLhPnXSPOu0b83/cUYs4irVBsKsgVTKsKhR9XmPQFpuLC3BU7iwq8KPEP3fFgrA11
 zHwXQDyHdO+r4Hlzjkam32vaVxBAmKN1aarqkpYcjWqXft9+wVi03VhsEEwB9AHH6LSqzxtH
 szV8rn6P8IMg7BaM77oUp1hqRmsMsV7nTsv299Ii0V8cQnDg3+WGrTvqT4U8yHe86EV/kyHW
 EyU31sWv9wb7fd9vjVXlDa/eXPmT69Li0FddTxh1/mr7U1BvPBYoWTeseBa5nNN5pb1VK0aX
 NI39mT54d7DBUjtpv5XWlLVxS4NjfP0Sf0jLbsvO/GjztrvH7o+4dIwpT7/yU9po0r8Bp3xZ
 7AsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sb0xTZxTGfe+/XogN1wr6hmA01ZC5hbILVA5GiSQkvvrJxX1Y5sQ1egNE
 2pLe1igfloKtwSpqGzC0FJyyGYUulRYU2ZptnQORsanEypiAizrDoqN2Gv9Q1EI14duTc57f
 c85JDk+rjnCZfKXBLJkMuio1l8oMvR4Yz3mIeso+drozwOv3cTDr6ldAV7Ofhcv2UQaidXYa
 ps8eRVB/kILTL1+xcOhkCbS2uBDMhro4iLujFDyKfQRPrg0o4M/wOQST39cm7H3PGAjci7Aw
 bevlIFr/HwsjfV4OJnxvWPDGG2kIN4UQzDx/nRjlHWSh2xrmwOF5wEHg8AgHvivtCrjiv0TB
 aKOVg1DTXQTDgfOJYdcnGOgZmqbBdkcLk64QtSmb+Np8iIxEbtBk5pULEfvxFxwZOdZAkTNT
 VoY4h3PIZc+4grT/MEWRo49sLAl0HOZIIOZSkN9bogy52jzDkBNnfkLkj4CP3pb1uWaDyWgx
 S6sqjLJ5o3qHCHkasQg0eQVFGjG/cOf6PK06t3jDHqmqcp9kyi3+UlMRqrUx1ZNL9jsb06zo
 UJoDpfBYKMDfzQYpB0rlVcK3CF/03lAkG1l48KSVTeqlOB5xcEnTY4R9fXfpucZSYQtuCP7K
 zOl0IRvXPfPMJ9HCv6n43CnvO8JF4f+n/pl3cYKIHY/nolJ4pVCMH7p+TCTxPCOswSF/zVw5
 Q9iJOyN2lLQswYPu+/NoSmLV1qbn83VaWIfbgn/TSb0SH+xpeaeX47H7p6gTSOVZgHsWIJ4F
 iGcB8jViOlC6ZJH15XpZ1Mg6vWwxlGt2G/UBlHjEi/0vg73oZtf2MBJ4pF6shCfBMhWr2ycf
 0IcR5ml1utK5v7tMpdyjO1AjmYy7TJYqSQ4jbeI2J52ZsduYeGuDeZeoFQuhSCzML8xfB+rl
 ynrh5y9UQrnOLO2VpGrJ9J6j+JRMK2oYt3x29kK2YfRpyYPWS78wv+21hHPNvY1Ct6apN3Ys
 frsgqq8prX0zel2/bKv2yFh/RXUs85vN/g+Ctzu/av5k4NOaOyp3WmST86+J9Mod9mFl3UTx
 8bHB8dPD8ZvnSXvbvVnH6s4hpbEzlJPb0V4Si6zZ0uApvbVIWGsrda/oyVIzcoVO/JA2ybq3
 og0iYZ4DAAA=
X-CMS-MailID: 20200508065327eucas1p21ec9f6144ed975dc1fa11d99b6dc3ffb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200507121658eucas1p240cf4a3e0fe5c22dda5ec4f72734149f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200507121658eucas1p240cf4a3e0fe5c22dda5ec4f72734149f
References: <20200414153455.21744-1-rppt@kernel.org>
 <20200414153455.21744-3-rppt@kernel.org>
 <CGME20200507121658eucas1p240cf4a3e0fe5c22dda5ec4f72734149f@eucas1p2.samsung.com>
 <39ba8a04-d6b5-649d-c289-0c8b27cb66c5@samsung.com>
 <20200507161155.GE683243@linux.ibm.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Jonas Bonn <jonas@southpole.se>,
 Brian Cain <bcain@codeaurora.org>, linux-hexagon@vger.kernel.org,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-arch@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 kvm-ppc@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

On 07.05.2020 18:11, Mike Rapoport wrote:
> On Thu, May 07, 2020 at 02:16:56PM +0200, Marek Szyprowski wrote:
>> On 14.04.2020 17:34, Mike Rapoport wrote:
>>> From: Mike Rapoport <rppt@linux.ibm.com>
>>>
>>> Implement primitives necessary for the 4th level folding, add walks of p4d
>>> level where appropriate, and remove __ARCH_USE_5LEVEL_HACK.
>>>
>>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>> Today I've noticed that kexec is broken on ARM 32bit. Bisecting between
>> current linux-next and v5.7-rc1 pointed to this commit. I've tested this
>> on Odroid XU4 and Raspberry Pi4 boards. Here is the relevant log:
>>
>> # kexec --kexec-syscall -l zImage --append "$(cat /proc/cmdline)"
>> memory_range[0]:0x40000000..0xbe9fffff
>> memory_range[0]:0x40000000..0xbe9fffff
>> # kexec -e
>> kexec_core: Starting new kernel
>> 8<--- cut here ---
>> Unable to handle kernel paging request at virtual address c010f1f4
>> pgd = c6817793
>> [c010f1f4] *pgd=4000041e(bad)
>> Internal error: Oops: 80d [#1] PREEMPT ARM
>> Modules linked in:
>> CPU: 0 PID: 1329 Comm: kexec Tainted: G        W
>> 5.7.0-rc3-00127-g6cba81ed0f62 #611
>> Hardware name: Samsung Exynos (Flattened Device Tree)
>> PC is at machine_kexec+0x40/0xfc
> Any chance you have the debug info in this kernel?
> scripts/faddr2line would come handy here.

# ./scripts/faddr2line --list vmlinux machine_kexec+0x40
machine_kexec+0x40/0xf8:

machine_kexec at arch/arm/kernel/machine_kexec.c:182
  177            reboot_code_buffer = 
page_address(image->control_code_page);
  178
  179            /* Prepare parameters for reboot_code_buffer*/
  180            set_kernel_text_rw();
  181            kexec_start_address = image->start;
 >182<           kexec_indirection_page = page_list;
  183            kexec_mach_type = machine_arch_type;
  184            kexec_boot_atags = image->arch.kernel_r2;
  185
  186            /* copy our kernel relocation code to the control code 
page */
  187            reboot_entry = fncpy(reboot_code_buffer,

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

