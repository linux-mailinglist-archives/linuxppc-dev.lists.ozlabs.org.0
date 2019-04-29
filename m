Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01263DD9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 10:21:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44syLF3w7hzDqSg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 18:21:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=depni.sinp.msu.ru
 (client-ip=213.131.7.21; helo=depni-mx.sinp.msu.ru;
 envelope-from=belyshev@depni.sinp.msu.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=depni.sinp.msu.ru
Received: from depni-mx.sinp.msu.ru (depni-mx.sinp.msu.ru [213.131.7.21])
 by lists.ozlabs.org (Postfix) with ESMTP id 44syJc1jVyzDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 18:20:13 +1000 (AEST)
Received: from spider (unknown [109.63.242.172])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id 50AEC1BF43A;
 Mon, 29 Apr 2019 11:22:29 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: BUG: crash in __tlb_remove_page_size with STRICT_KERNEL_RWX on
 BOOK3S_32
References: <87pnp9mknl.fsf@depni.sinp.msu.ru>
 <db886597-8867-93e6-a507-6da4963ce0bd@c-s.fr>
 <878svwn85h.fsf@depni.sinp.msu.ru>
 <0cb9dc35-af5b-912f-53b6-d83558ecbbcb@c-s.fr>
Date: Mon, 29 Apr 2019 11:20:09 +0300
In-Reply-To: <0cb9dc35-af5b-912f-53b6-d83558ecbbcb@c-s.fr> (Christophe Leroy's
 message of "Mon, 29 Apr 2019 07:31:10 +0000")
Message-ID: <87k1fd5ikm.fsf@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

> As pointed by Segher, those are not correct, bat 2 for instance should
> be 0xc0c00000-0xc0ffffff
>
> Could you try the below changes ?
>
> commit 5953416b8ef52107e8f04559a08a90aa5368cfcd
> Author: Christophe Leroy <christophe.leroy@c-s.fr>
> Date:   Mon Apr 29 07:22:08 2019 +0000
>
>     powerpc/32s: fix BATs setting with CONFIG_STRICT_KERNEL_RWX
>

The box did boot successfully, and survived disk read test, thanks!
Here is the new debug information for the record:


> /sys/kernel/debug/kernel_page_tables

---[ Start of kernel VM ]---
0xe0000000-0xefffffff  0x20000000       256M        rw       present           dirty  accessed                         
---[ vmalloc() Area ]---
0xf1000000-0xf1000fff  0x80041000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf1002000-0xf1003fff  0x80041000         8K        rw       present  guarded  dirty  accessed                 no cache
0xf1005000-0xf1005fff  0x80060000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf1007000-0xf1007fff  0x80050000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf100a000-0xf100bfff  0xf8001000         8K        rw       present  guarded  dirty  accessed                 no cache
0xf100d000-0xf100dfff  0x80018000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf1010000-0xf1011fff  0xa0006000         8K        rw       present  guarded  dirty  accessed                 no cache
0xf101b000-0xf1025fff  0x3fc00000        44K        rw       present           dirty  accessed                         
0xf1027000-0xf1027fff  0xb87ff000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf1029000-0xf1029fff  0xba7ff000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf102b000-0xf106afff  0x2f300000       256K        rw       present  guarded  dirty  accessed                 no cache
0xf106c000-0xf106ffff  0x3fc0b000        16K        rw       present           dirty  accessed                         
0xf1071000-0xf1071fff  0x80020000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf1074000-0xf1077fff  0xf5004000        16K        rw       present  guarded  dirty  accessed                 no cache
0xf107a000-0xf107bfff  0x80008000         8K        rw       present  guarded  dirty  accessed                 no cache
0xf107d000-0xf107dfff  0xf5000000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf1080000-0xf118afff  0xb8008000      1068K        rw       present  guarded  dirty  accessed                 no cache
0xf1195000-0xf1196fff  0x2f13e000         8K        rw       present           dirty  accessed                         
0xf1197000-0xf119cfff  0x2f3a0000        24K        rw       present           dirty  accessed                         
0xf119d000-0xf119efff  0x2f13e000         8K        rw       present           dirty  accessed                         
0xf11a0000-0xf11a5fff  0x2f3a6000        24K        rw       present           dirty  accessed                         
0xf11a6000-0xf11a7fff  0x2f196000         8K        rw       present           dirty  accessed                         
0xf11a8000-0xf11a9fff  0x2f3a6000         8K        rw       present           dirty  accessed                         
0xf11ab000-0xf11abfff  0xa0004000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf11ad000-0xf11adfff  0xa0000000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf11af000-0xf11affff  0xa0003000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf11b1000-0xf11b1fff  0xa0002000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf11b3000-0xf11b3fff  0xa0001000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf11b5000-0xf11b5fff  0x80010000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf11b7000-0xf11b7fff  0x80008000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf11b9000-0xf11b9fff  0x80008000         4K        rw       present  guarded  dirty  accessed                 no cache
0xf11bd000-0xf11bdfff  0x3fc8b000         4K        rw       present           dirty  accessed                         
0xf11c0000-0xf11cffff  0x88000000        64K        rw       present  guarded  dirty  accessed                 no cache
0xf1200000-0xf1259fff  0xba008000       360K        rw       present  guarded  dirty  accessed                 no cache
0xf1280000-0xf147ffff  0xf5200000         2M        rw       present  guarded  dirty  accessed                 no cache
0xf1551000-0xf1551fff  0x3fc17000         4K        rw       present           dirty  accessed                         
0xf1552000-0xf1556fff  0x3fc0f000        20K        rw       present           dirty  accessed                         
0xf1557000-0xf15c9fff  0x3fc18000       460K        rw       present           dirty  accessed                         
0xf15d7000-0xf15d7fff  0x3fc16000         4K        rw       present           dirty  accessed                         
0xf15d8000-0xf15d8fff  0x3fc15000         4K        rw       present           dirty  accessed                         
0xf15d9000-0xf15d9fff  0x3fc14000         4K        rw       present           dirty  accessed                         
0xf15eb000-0xf15edfff  0x3fc8c000        12K        rw       present           dirty  accessed                         
0xf15f3000-0xf15f3fff  0x3fc91000         4K        rw       present           dirty  accessed                         
0xf15f4000-0xf15f4fff  0x3fc90000         4K        rw       present           dirty  accessed                         
0xf15f5000-0xf15f5fff  0x3fc8f000         4K        rw       present           dirty  accessed                         
0xf15f7000-0xf15f9fff  0x3fc92000        12K        rw       present           dirty  accessed                         
0xf15fb000-0xf15fdfff  0x3fc95000        12K        rw       present           dirty  accessed                         
0xf15ff000-0xf1601fff  0x3fc98000        12K        rw       present           dirty  accessed                         
0xf1603000-0xf1605fff  0x3fc9b000        12K        rw       present           dirty  accessed                         
0xf1607000-0xf1609fff  0x3fc9e000        12K        rw       present           dirty  accessed                         
---[ vmalloc() End ]---
---[ Early I/O remap start ]---
0xfde2b000-0xfde2cfff  0x80016000         8K        rw       present  guarded  dirty  accessed                 no cache
0xfde2d000-0xfde2dfff  0x80000000         4K        rw       present  guarded  dirty  accessed                 no cache
0xfde2e000-0xfde2efff  0xf8000000         4K        rw       present  guarded  dirty  accessed                 no cache
0xfde2f000-0xfe62efff  0xf4000000         8M        rw       present  guarded  dirty  accessed                 no cache
0xfe62f000-0xfe62ffff  0xf4c00000         4K        rw       present  guarded  dirty  accessed                 no cache
0xfe630000-0xfe630fff  0xf4800000         4K        rw       present  guarded  dirty  accessed                 no cache
0xfe631000-0xfee30fff  0xf2000000         8M        rw       present  guarded  dirty  accessed                 no cache
0xfee31000-0xfee31fff  0xf2c00000         4K        rw       present  guarded  dirty  accessed                 no cache
0xfee32000-0xfee32fff  0xf2800000         4K        rw       present  guarded  dirty  accessed                 no cache
0xfee33000-0xff632fff  0xf0000000         8M        rw       present  guarded  dirty  accessed                 no cache
0xff633000-0xff633fff  0xf0c00000         4K        rw       present  guarded  dirty  accessed                 no cache
0xff634000-0xff634fff  0xf0800000         4K        rw       present  guarded  dirty  accessed                 no cache
0xff635000-0xff73ffff  0xb8008000      1068K        rw       present           dirty  accessed                 no cache
0xff740000-0xff7bffff  0x80000000       512K        rw       present  guarded  dirty  accessed                 no cache
0xff7c0000-0xff7fffff  0xf8000000       256K        rw       present  guarded  dirty  accessed                 no cache
---[ Early I/O remap end ]---
---[ Highmem PTEs start ]---
0xff801000-0xff801fff  0x3f804000         4K        rw       present           dirty  accessed                         
0xff802000-0xff802fff  0x3fb06000         4K        rw       present           dirty  accessed                         
0xff803000-0xff803fff  0x3fb44000         4K        rw       present           dirty  accessed                         
0xff804000-0xff804fff  0x3fb4e000         4K        rw       present           dirty  accessed                         
0xff805000-0xff805fff  0x3fb95000         4K        rw       present           dirty  accessed                         
0xff806000-0xff806fff  0x3fbd3000         4K        rw       present           dirty  accessed                         
0xff807000-0xff807fff  0x3fbda000         4K        rw       present           dirty  accessed                         
0xff808000-0xff808fff  0x3fbdd000         4K        rw       present           dirty  accessed                         
0xff809000-0xff809fff  0x3f417000         4K        rw       present           dirty  accessed                         
0xff80a000-0xff80afff  0x3f461000         4K        rw       present           dirty  accessed                         
0xff80b000-0xff80bfff  0x3f4a5000         4K        rw       present           dirty  accessed                         
0xff80c000-0xff80cfff  0x3f4b7000         4K        rw       present           dirty  accessed                         
0xff80d000-0xff80dfff  0x3f44c000         4K        rw       present           dirty  accessed                         
0xff80e000-0xff80efff  0x3f469000         4K        rw       present           dirty  accessed                         
0xff80f000-0xff80ffff  0x3f51a000         4K        rw       present           dirty  accessed                         
0xff810000-0xff810fff  0x3f53b000         4K        rw       present           dirty  accessed                         
0xff811000-0xff811fff  0x3f578000         4K        rw       present           dirty  accessed                         
0xff812000-0xff812fff  0x3f53d000         4K        rw       present           dirty  accessed                         
0xff813000-0xff813fff  0x3f5b2000         4K        rw       present           dirty  accessed                         
0xff814000-0xff814fff  0x3f6f4000         4K        rw       present           dirty  accessed                         
0xff815000-0xff815fff  0x3f6db000         4K        rw       present           dirty  accessed                         
0xff816000-0xff816fff  0x3f6da000         4K        rw       present           dirty  accessed                         
0xff817000-0xff817fff  0x3f708000         4K        rw       present           dirty  accessed                         
0xff818000-0xff818fff  0x3f731000         4K        rw       present           dirty  accessed                         
0xff819000-0xff819fff  0x3f6aa000         4K        rw       present           dirty  accessed                         
0xff81a000-0xff81afff  0x3f697000         4K        rw       present           dirty  accessed                         
0xff81b000-0xff81bfff  0x3f6a5000         4K        rw       present           dirty  accessed                         
0xff81c000-0xff81cfff  0x3f6a1000         4K        rw       present           dirty  accessed                         
0xff81d000-0xff81dfff  0x3f6a9000         4K        rw       present           dirty  accessed                         
0xff81e000-0xff81efff  0x3f683000         4K        rw       present           dirty  accessed                         
0xff81f000-0xff81ffff  0x3f736000         4K        rw       present           dirty  accessed                         
0xff820000-0xff820fff  0x3f695000         4K        rw       present           dirty  accessed                         
0xff821000-0xff821fff  0x3f6ef000         4K        rw       present           dirty  accessed                         
0xff822000-0xff822fff  0x3f685000         4K        rw       present           dirty  accessed                         
0xff823000-0xff823fff  0x3f70a000         4K        rw       present           dirty  accessed                         
0xff824000-0xff824fff  0x3f6b0000         4K        rw       present           dirty  accessed                         
0xff825000-0xff825fff  0x3f6a6000         4K        rw       present           dirty  accessed                         
0xff826000-0xff826fff  0x3f69b000         4K        rw       present           dirty  accessed                         
0xff827000-0xff827fff  0x3f527000         4K        rw       present           dirty  accessed                         
0xff828000-0xff828fff  0x3f69d000         4K        rw       present           dirty  accessed                         
0xff829000-0xff829fff  0x3f699000         4K        rw       present           dirty  accessed                         
0xff82a000-0xff82bfff  0x3f51b000         8K        rw       present           dirty  accessed                         
0xff82c000-0xff82cfff  0x3f72c000         4K        rw       present           dirty  accessed                         
0xff82d000-0xff82dfff  0x3faf5000         4K        rw       present           dirty  accessed                         
0xff82e000-0xff82efff  0x3fafc000         4K        rw       present           dirty  accessed                         
0xff82f000-0xff82ffff  0x3f440000         4K        rw       present           dirty  accessed                         
0xff830000-0xff830fff  0x3f51f000         4K        rw       present           dirty  accessed                         
0xff831000-0xff831fff  0x3f684000         4K        rw       present           dirty  accessed                         
0xff832000-0xff832fff  0x3f01a000         4K        rw       present           dirty  accessed                         
0xff833000-0xff833fff  0x3f75e000         4K        rw       present           dirty  accessed                         
0xff834000-0xff834fff  0x3f0cb000         4K        rw       present           dirty  accessed                         
0xff835000-0xff835fff  0x3f0d5000         4K        rw       present           dirty  accessed                         
0xff836000-0xff836fff  0x3f0db000         4K        rw       present           dirty  accessed                         
0xff837000-0xff837fff  0x3f0d4000         4K        rw       present           dirty  accessed                         
0xff838000-0xff838fff  0x3f0d0000         4K        rw       present           dirty  accessed                         
0xff839000-0xff839fff  0x3f098000         4K        rw       present           dirty  accessed                         
0xff83a000-0xff83afff  0x3f0e4000         4K        rw       present           dirty  accessed                         
0xff83b000-0xff83bfff  0x3f11e000         4K        rw       present           dirty  accessed                         
0xff83c000-0xff83cfff  0x3f128000         4K        rw       present           dirty  accessed                         
0xff83d000-0xff83efff  0x3f133000         8K        rw       present           dirty  accessed                         
0xff83f000-0xff83ffff  0x3f124000         4K        rw       present           dirty  accessed                         
0xff840000-0xff840fff  0x3f11a000         4K        rw       present           dirty  accessed                         
0xff841000-0xff841fff  0x3f135000         4K        rw       present           dirty  accessed                         
0xff842000-0xff842fff  0x3f13e000         4K        rw       present           dirty  accessed                         
0xff843000-0xff843fff  0x3f131000         4K        rw       present           dirty  accessed                         
0xff844000-0xff844fff  0x3f11c000         4K        rw       present           dirty  accessed                         
0xff845000-0xff845fff  0x3f11f000         4K        rw       present           dirty  accessed                         
0xff846000-0xff846fff  0x3f117000         4K        rw       present           dirty  accessed                         
0xff847000-0xff847fff  0x3f139000         4K        rw       present           dirty  accessed                         
0xff848000-0xff848fff  0x3f116000         4K        rw       present           dirty  accessed                         
0xff849000-0xff849fff  0x3f120000         4K        rw       present           dirty  accessed                         
0xff84a000-0xff84afff  0x3f115000         4K        rw       present           dirty  accessed                         
0xff84b000-0xff84bfff  0x3f14c000         4K        rw       present           dirty  accessed                         
0xff84c000-0xff84cfff  0x3f148000         4K        rw       present           dirty  accessed                         
0xff84d000-0xff84dfff  0x3f14b000         4K        rw       present           dirty  accessed                         
0xff84e000-0xff84efff  0x3f1f9000         4K        rw       present           dirty  accessed                         
0xff84f000-0xff84ffff  0x3f2ae000         4K        rw       present           dirty  accessed                         
0xff850000-0xff850fff  0x3f11d000         4K        rw       present           dirty  accessed                         
0xff851000-0xff851fff  0x3ede3000         4K        rw       present           dirty  accessed                         
0xff852000-0xff852fff  0x3ee2d000         4K        rw       present           dirty  accessed                         
0xff853000-0xff853fff  0x3ee96000         4K        rw       present           dirty  accessed                         
0xff854000-0xff854fff  0x3ef45000         4K        rw       present           dirty  accessed                         
0xff855000-0xff855fff  0x3ef9a000         4K        rw       present           dirty  accessed                         
0xff856000-0xff856fff  0x3edf4000         4K        rw       present           dirty  accessed                         
0xff857000-0xff857fff  0x3eea5000         4K        rw       present           dirty  accessed                         
0xff858000-0xff858fff  0x3ee2f000         4K        rw       present           dirty  accessed                         
0xff859000-0xff859fff  0x3efec000         4K        rw       present           dirty  accessed                         
0xff85a000-0xff85afff  0x3eeb0000         4K        rw       present           dirty  accessed                         
0xff85b000-0xff85bfff  0x3e8b6000         4K        rw       present           dirty  accessed                         
0xff85c000-0xff85cfff  0x3effe000         4K        rw       present           dirty  accessed                         
0xff85d000-0xff85dfff  0x3e800000         4K        rw       present           dirty  accessed                         
0xff85e000-0xff85efff  0x3e8b9000         4K        rw       present           dirty  accessed                         
0xff85f000-0xff85ffff  0x3e914000         4K        rw       present           dirty  accessed                         
0xff860000-0xff860fff  0x3e930000         4K        rw       present           dirty  accessed                         
0xff861000-0xff861fff  0x3e948000         4K        rw       present           dirty  accessed                         
0xff862000-0xff862fff  0x3e94f000         4K        rw       present           dirty  accessed                         
0xff863000-0xff863fff  0x3e956000         4K        rw       present           dirty  accessed                         
0xff864000-0xff864fff  0x3e95f000         4K        rw       present           dirty  accessed                         
0xff865000-0xff865fff  0x3e968000         4K        rw       present           dirty  accessed                         
0xff866000-0xff866fff  0x3e974000         4K        rw       present           dirty  accessed                         
0xff867000-0xff867fff  0x3eacb000         4K        rw       present           dirty  accessed                         
0xff868000-0xff868fff  0x3e8e3000         4K        rw       present           dirty  accessed                         
0xff869000-0xff869fff  0x3e8b1000         4K        rw       present           dirty  accessed                         
0xff86a000-0xff86afff  0x3e901000         4K        rw       present           dirty  accessed                         
0xff86b000-0xff86bfff  0x3e47c000         4K        rw       present           dirty  accessed                         
0xff86c000-0xff86cfff  0x3e492000         4K        rw       present           dirty  accessed                         
0xff86d000-0xff86dfff  0x3e48d000         4K        rw       present           dirty  accessed                         
0xff86e000-0xff86efff  0x3e4cb000         4K        rw       present           dirty  accessed                         
0xff86f000-0xff86ffff  0x3e4fa000         4K        rw       present           dirty  accessed                         
0xff870000-0xff870fff  0x3e50c000         4K        rw       present           dirty  accessed                         
0xff871000-0xff871fff  0x3e458000         4K        rw       present           dirty  accessed                         
0xff872000-0xff872fff  0x3e4fe000         4K        rw       present           dirty  accessed                         
0xff873000-0xff873fff  0x3e905000         4K        rw       present           dirty  accessed                         
0xff874000-0xff874fff  0x3eb0c000         4K        rw       present           dirty  accessed                         
0xff875000-0xff875fff  0x3e524000         4K        rw       present           dirty  accessed                         
0xff876000-0xff876fff  0x3e547000         4K        rw       present           dirty  accessed                         
0xff877000-0xff877fff  0x3e8fc000         4K        rw       present           dirty  accessed                         
0xff878000-0xff878fff  0x3e557000         4K        rw       present           dirty  accessed                         
0xff879000-0xff879fff  0x3e559000         4K        rw       present           dirty  accessed                         
0xff87a000-0xff87afff  0x3e505000         4K        rw       present           dirty  accessed                         
0xff87b000-0xff87bfff  0x3e8ff000         4K        rw       present           dirty  accessed                         
0xff87c000-0xff87cfff  0x3e4e4000         4K        rw       present           dirty  accessed                         
0xff87d000-0xff87dfff  0x3e4fb000         4K        rw       present           dirty  accessed                         
0xff87e000-0xff87efff  0x3ea66000         4K        rw       present           dirty  accessed                         
0xff87f000-0xff87ffff  0x3ea03000         4K        rw       present           dirty  accessed                         
0xff880000-0xff880fff  0x3e50b000         4K        rw       present           dirty  accessed                         
0xff881000-0xff881fff  0x3e585000         4K        rw       present           dirty  accessed                         
0xff882000-0xff882fff  0x3e753000         4K        rw       present           dirty  accessed                         
0xff883000-0xff883fff  0x3e7fe000         4K        rw       present           dirty  accessed                         
0xff884000-0xff884fff  0x3e7d5000         4K        rw       present           dirty  accessed                         
0xff885000-0xff885fff  0x3e038000         4K        rw       present           dirty  accessed                         
0xff886000-0xff887fff  0x3e034000         8K        rw       present           dirty  accessed                         
0xff888000-0xff888fff  0x3e04a000         4K        rw       present           dirty  accessed                         
0xff889000-0xff889fff  0x3e52b000         4K        rw       present           dirty  accessed                         
0xff88a000-0xff88afff  0x3e09b000         4K        rw       present           dirty  accessed                         
0xff88b000-0xff88bfff  0x3e08f000         4K        rw       present           dirty  accessed                         
0xff88c000-0xff88cfff  0x3e05c000         4K        rw       present           dirty  accessed                         
0xff88d000-0xff88dfff  0x3e09e000         4K        rw       present           dirty  accessed                         
0xff88e000-0xff88efff  0x3e0a7000         4K        rw       present           dirty  accessed                         
0xff88f000-0xff88ffff  0x3e0af000         4K        rw       present           dirty  accessed                         
0xff890000-0xff890fff  0x3e0b6000         4K        rw       present           dirty  accessed                         
0xff891000-0xff891fff  0x3e0bc000         4K        rw       present           dirty  accessed                         
0xff892000-0xff892fff  0x3e090000         4K        rw       present           dirty  accessed                         
0xff893000-0xff893fff  0x3e097000         4K        rw       present           dirty  accessed                         
0xff894000-0xff894fff  0x3e094000         4K        rw       present           dirty  accessed                         
0xff895000-0xff895fff  0x3e0cd000         4K        rw       present           dirty  accessed                         
0xff896000-0xff896fff  0x3f3b9000         4K        rw       present           dirty  accessed                         
0xff897000-0xff897fff  0x3f1ea000         4K        rw       present           dirty  accessed                         
0xff898000-0xff898fff  0x3ec3b000         4K        rw       present           dirty  accessed                         
0xff899000-0xff899fff  0x3f113000         4K        rw       present           dirty  accessed                         
0xff89a000-0xff89afff  0x3e0e7000         4K        rw       present           dirty  accessed                         
0xff89b000-0xff89bfff  0x3e11f000         4K        rw       present           dirty  accessed                         
0xff89c000-0xff89cfff  0x3f1a8000         4K        rw       present           dirty  accessed                         
0xff89d000-0xff89dfff  0x3e4ce000         4K        rw       present           dirty  accessed                         
0xff89e000-0xff89efff  0x3f193000         4K        rw       present           dirty  accessed                         
0xff89f000-0xff89ffff  0x3f1dc000         4K        rw       present           dirty  accessed                         
0xff8a0000-0xff8a0fff  0x3e07d000         4K        rw       present           dirty  accessed                         
0xff8a1000-0xff8a1fff  0x3e93a000         4K        rw       present           dirty  accessed                         
0xff8a2000-0xff8a2fff  0x3ec9c000         4K        rw       present           dirty  accessed                         
0xff8a3000-0xff8a3fff  0x3ecc4000         4K        rw       present           dirty  accessed                         
0xff8a4000-0xff8a4fff  0x3e553000         4K        rw       present           dirty  accessed                         
0xff8a5000-0xff8a5fff  0x3e51e000         4K        rw       present           dirty  accessed                         
0xff8a6000-0xff8a6fff  0x3e523000         4K        rw       present           dirty  accessed                         
0xff8a7000-0xff8a7fff  0x3e516000         4K        rw       present           dirty  accessed                         
0xff8a8000-0xff8a8fff  0x3e562000         4K        rw       present           dirty  accessed                         
0xff8a9000-0xff8a9fff  0x3e1b3000         4K        rw       present           dirty  accessed                         
0xff8aa000-0xff8aafff  0x3e1cd000         4K        rw       present           dirty  accessed                         
0xff8ab000-0xff8abfff  0x3e1e9000         4K        rw       present           dirty  accessed                         
0xff8ac000-0xff8acfff  0x3e563000         4K        rw       present           dirty  accessed                         
0xff8ad000-0xff8adfff  0x3e1b5000         4K        rw       present           dirty  accessed                         
0xff8ae000-0xff8aefff  0x3e20c000         4K        rw       present           dirty  accessed                         
0xff8af000-0xff8affff  0x3e207000         4K        rw       present           dirty  accessed                         
0xff8b0000-0xff8b0fff  0x3e1be000         4K        rw       present           dirty  accessed                         
0xff8b1000-0xff8b1fff  0x3e1f7000         4K        rw       present           dirty  accessed                         
0xff8b2000-0xff8b2fff  0x3e245000         4K        rw       present           dirty  accessed                         
0xff8b3000-0xff8b3fff  0x3e2a6000         4K        rw       present           dirty  accessed                         
0xff8b4000-0xff8b4fff  0x3e2b2000         4K        rw       present           dirty  accessed                         
0xff8b5000-0xff8b5fff  0x3e2be000         4K        rw       present           dirty  accessed                         
0xff8b6000-0xff8b6fff  0x3e2d9000         4K        rw       present           dirty  accessed                         
0xff8b7000-0xff8b7fff  0x3e31c000         4K        rw       present           dirty  accessed                         
0xff8b8000-0xff8b8fff  0x3ed39000         4K        rw       present           dirty  accessed                         
0xff8b9000-0xff8b9fff  0x3e369000         4K        rw       present           dirty  accessed                         
0xff8ba000-0xff8bafff  0x3e368000         4K        rw       present           dirty  accessed                         
0xff8bb000-0xff8bbfff  0x3e314000         4K        rw       present           dirty  accessed                         
0xff8bc000-0xff8bcfff  0x3e8c6000         4K        rw       present           dirty  accessed                         
0xff8bd000-0xff8bdfff  0x3ddaa000         4K        rw       present           dirty  accessed                         
0xff8be000-0xff8befff  0x3dcde000         4K        rw       present           dirty  accessed                         
0xff8bf000-0xff8bffff  0x3e06e000         4K        rw       present           dirty  accessed                         
0xff8c0000-0xff8c0fff  0x3e5d9000         4K        rw       present           dirty  accessed                         
0xff8c1000-0xff8c1fff  0x3e3f2000         4K        rw       present           dirty  accessed                         
0xff8c2000-0xff8c2fff  0x3e2ef000         4K        rw       present           dirty  accessed                         
0xff8c3000-0xff8c3fff  0x3e294000         4K        rw       present           dirty  accessed                         
0xff8c4000-0xff8c4fff  0x3dd90000         4K        rw       present           dirty  accessed                         
0xff8c5000-0xff8c5fff  0x3e8fb000         4K        rw       present           dirty  accessed                         
0xff8c6000-0xff8c6fff  0x3e1b4000         4K        rw       present           dirty  accessed                         
0xff8c7000-0xff8c7fff  0x3e225000         4K        rw       present           dirty  accessed                         
0xff8c8000-0xff8c8fff  0x3f1e8000         4K        rw       present           dirty  accessed                         
0xff8c9000-0xff8c9fff  0x3ec67000         4K        rw       present           dirty  accessed                         
0xff8ca000-0xff8cafff  0x3e0f9000         4K        rw       present           dirty  accessed                         
0xff8cb000-0xff8cbfff  0x3f1a4000         4K        rw       present           dirty  accessed                         
0xff8cc000-0xff8ccfff  0x3f1e9000         4K        rw       present           dirty  accessed                         
0xff8cd000-0xff8cdfff  0x3f3d0000         4K        rw       present           dirty  accessed                         
0xff8ce000-0xff8cefff  0x3e0e6000         4K        rw       present           dirty  accessed                         
0xff8cf000-0xff8cffff  0x3f1ed000         4K        rw       present           dirty  accessed                         
0xff8d0000-0xff8d0fff  0x3f1de000         4K        rw       present           dirty  accessed                         
0xff8d1000-0xff8d1fff  0x3f109000         4K        rw       present           dirty  accessed                         
0xff8d2000-0xff8d2fff  0x3f530000         4K        rw       present           dirty  accessed                         
0xff8d3000-0xff8d3fff  0x3f518000         4K        rw       present           dirty  accessed                         
0xff8d4000-0xff8d4fff  0x3e8b0000         4K        rw       present           dirty  accessed                         
0xff8d5000-0xff8d5fff  0x3eccc000         4K        rw       present           dirty  accessed                         
0xff8d6000-0xff8d6fff  0x3e2ae000         4K        rw       present           dirty  accessed                         
0xff8d7000-0xff8d7fff  0x3f535000         4K        rw       present           dirty  accessed                         
0xff8d8000-0xff8d8fff  0x3e558000         4K        rw       present           dirty  accessed                         
0xff8d9000-0xff8d9fff  0x3e4d6000         4K        rw       present           dirty  accessed                         
0xff8da000-0xff8dafff  0x3e21e000         4K        rw       present           dirty  accessed                         
0xff8db000-0xff8dbfff  0x3f51e000         4K        rw       present           dirty  accessed                         
0xff8dc000-0xff8dcfff  0x3e8ec000         4K        rw       present           dirty  accessed                         
0xff8dd000-0xff8ddfff  0x3e535000         4K        rw       present           dirty  accessed                         
0xff8de000-0xff8defff  0x3e050000         4K        rw       present           dirty  accessed                         
0xff8df000-0xff8dffff  0x3e886000         4K        rw       present           dirty  accessed                         
0xff8e0000-0xff8e0fff  0x3e55c000         4K        rw       present           dirty  accessed                         
0xff8e1000-0xff8e1fff  0x3e3ac000         4K        rw       present           dirty  accessed                         
0xff8e2000-0xff8e2fff  0x3dd20000         4K        rw       present           dirty  accessed                         
0xff8e3000-0xff8e3fff  0x3e53b000         4K        rw       present           dirty  accessed                         
0xff8e4000-0xff8e4fff  0x3e18b000         4K        rw       present           dirty  accessed                         
0xff8e5000-0xff8e5fff  0x3e38a000         4K        rw       present           dirty  accessed                         
0xff8e6000-0xff8e6fff  0x3e519000         4K        rw       present           dirty  accessed                         
0xff8e7000-0xff8e7fff  0x3e8e4000         4K        rw       present           dirty  accessed                         
0xff8e8000-0xff8e8fff  0x3ec61000         4K        rw       present           dirty  accessed                         
0xff8e9000-0xff8e9fff  0x3ed3f000         4K        rw       present           dirty  accessed                         
0xff8ea000-0xff8eafff  0x3dc3a000         4K        rw       present           dirty  accessed                         
0xff8eb000-0xff8ebfff  0x3dc39000         4K        rw       present           dirty  accessed                         
0xff8ec000-0xff8ecfff  0x3e0d4000         4K        rw       present           dirty  accessed                         
0xff8ed000-0xff8edfff  0x3eca3000         4K        rw       present           dirty  accessed                         
0xff8ee000-0xff8eefff  0x3e4a3000         4K        rw       present           dirty  accessed                         
0xff8ef000-0xff8effff  0x3dd6a000         4K        rw       present           dirty  accessed                         
0xff8f0000-0xff8f0fff  0x3f2da000         4K        rw       present           dirty  accessed                         
0xff8f1000-0xff8f1fff  0x3ec6c000         4K        rw       present           dirty  accessed                         
0xff8f2000-0xff8f2fff  0x3f0c1000         4K        rw       present           dirty  accessed                         
0xff8f3000-0xff8f3fff  0x3f52a000         4K        rw       present           dirty  accessed                         
0xff8f4000-0xff8f4fff  0x3e29a000         4K        rw       present           dirty  accessed                         
0xff8f5000-0xff8f5fff  0x3ec9f000         4K        rw       present           dirty  accessed                         
0xff8f6000-0xff8f6fff  0x3e2d5000         4K        rw       present           dirty  accessed                         
0xff8f7000-0xff8f7fff  0x3dcb3000         4K        rw       present           dirty  accessed                         
0xff8f8000-0xff8f8fff  0x3dccc000         4K        rw       present           dirty  accessed                         
0xff8f9000-0xff8f9fff  0x3dc1b000         4K        rw       present           dirty  accessed                         
0xff8fa000-0xff8fafff  0x3dcb2000         4K        rw       present           dirty  accessed                         
0xff8fb000-0xff8fbfff  0x3dce1000         4K        rw       present           dirty  accessed                         
0xff8fc000-0xff8fcfff  0x3e287000         4K        rw       present           dirty  accessed                         
0xff8fd000-0xff8fdfff  0x3e060000         4K        rw       present           dirty  accessed                         
0xff8fe000-0xff8fefff  0x3e3f9000         4K        rw       present           dirty  accessed                         
0xff8ff000-0xff8fffff  0x3e18f000         4K        rw       present           dirty  accessed                         
0xff900000-0xff900fff  0x3dd95000         4K        rw       present           dirty  accessed                         
0xff901000-0xff901fff  0x3dd49000         4K        rw       present           dirty  accessed                         
0xff902000-0xff902fff  0x3dccd000         4K        rw       present           dirty  accessed                         
0xff903000-0xff903fff  0x3dda6000         4K        rw       present           dirty  accessed                         
0xff904000-0xff904fff  0x3e2df000         4K        rw       present           dirty  accessed                         
0xff905000-0xff905fff  0x3e300000         4K        rw       present           dirty  accessed                         
0xff906000-0xff906fff  0x3f2fb000         4K        rw       present           dirty  accessed                         
0xff907000-0xff907fff  0x3e90c000         4K        rw       present           dirty  accessed                         
0xff908000-0xff908fff  0x3dca6000         4K        rw       present           dirty  accessed                         
0xff909000-0xff909fff  0x3dcbf000         4K        rw       present           dirty  accessed                         
0xff90a000-0xff90afff  0x3ec3c000         4K        rw       present           dirty  accessed                         
0xff90b000-0xff90bfff  0x3dd9b000         4K        rw       present           dirty  accessed                         
0xff90c000-0xff90cfff  0x3e291000         4K        rw       present           dirty  accessed                         
0xff90d000-0xff90dfff  0x3e752000         4K        rw       present           dirty  accessed                         
0xff90e000-0xff90ffff  0x3e49a000         8K        rw       present           dirty  accessed                         
0xff910000-0xff910fff  0x3dc8b000         4K        rw       present           dirty  accessed                         
0xff911000-0xff911fff  0x3e49d000         4K        rw       present           dirty  accessed                         
0xff912000-0xff912fff  0x3dc99000         4K        rw       present           dirty  accessed                         
0xff913000-0xff913fff  0x3dd8c000         4K        rw       present           dirty  accessed                         
0xff914000-0xff914fff  0x3dc91000         4K        rw       present           dirty  accessed                         
0xff915000-0xff915fff  0x3e49c000         4K        rw       present           dirty  accessed                         
0xff916000-0xff916fff  0x3e9bf000         4K        rw       present           dirty  accessed                         
0xff917000-0xff917fff  0x3e49f000         4K        rw       present           dirty  accessed                         
0xff918000-0xff918fff  0x3dda1000         4K        rw       present           dirty  accessed                         
0xff919000-0xff919fff  0x3e28f000         4K        rw       present           dirty  accessed                         
0xff91a000-0xff91afff  0x3dc9d000         4K        rw       present           dirty  accessed                         
0xff91b000-0xff91bfff  0x3e28e000         4K        rw       present           dirty  accessed                         
0xff91c000-0xff91cfff  0x3dc90000         4K        rw       present           dirty  accessed                         
0xff91d000-0xff91dfff  0x3e373000         4K        rw       present           dirty  accessed                         
0xff91e000-0xff91efff  0x3e22b000         4K        rw       present           dirty  accessed                         
0xff91f000-0xff91ffff  0x3ddcd000         4K        rw       present           dirty  accessed                         
0xff920000-0xff920fff  0x3ddd4000         4K        rw       present           dirty  accessed                         
0xff921000-0xff921fff  0x3dc98000         4K        rw       present           dirty  accessed                         
0xff922000-0xff922fff  0x3ddb5000         4K        rw       present           dirty  accessed                         
0xff923000-0xff923fff  0x3dc93000         4K        rw       present           dirty  accessed                         
0xff924000-0xff924fff  0x3ddb9000         4K        rw       present           dirty  accessed                         
0xff925000-0xff925fff  0x3dcaf000         4K        rw       present           dirty  accessed                         
0xff926000-0xff926fff  0x3ddc6000         4K        rw       present           dirty  accessed                         
0xff927000-0xff927fff  0x3ddc9000         4K        rw       present           dirty  accessed                         
0xff928000-0xff928fff  0x3ddba000         4K        rw       present           dirty  accessed                         
0xff929000-0xff929fff  0x3e301000         4K        rw       present           dirty  accessed                         
0xff92a000-0xff92afff  0x3dcad000         4K        rw       present           dirty  accessed                         
0xff92b000-0xff92bfff  0x3dcc5000         4K        rw       present           dirty  accessed                         
0xff92c000-0xff92cfff  0x3ddc0000         4K        rw       present           dirty  accessed                         
0xff92d000-0xff92dfff  0x3e8af000         4K        rw       present           dirty  accessed                         
0xff92e000-0xff92efff  0x3dcb7000         4K        rw       present           dirty  accessed                         
0xff92f000-0xff92ffff  0x3e237000         4K        rw       present           dirty  accessed                         
0xff930000-0xff930fff  0x3ddbb000         4K        rw       present           dirty  accessed                         
0xff931000-0xff931fff  0x3e3f3000         4K        rw       present           dirty  accessed                         
0xff932000-0xff932fff  0x3ddbe000         4K        rw       present           dirty  accessed                         
0xff933000-0xff933fff  0x3e28b000         4K        rw       present           dirty  accessed                         
0xff934000-0xff934fff  0x3e7d3000         4K        rw       present           dirty  accessed                         
0xff935000-0xff935fff  0x3f54d000         4K        rw       present           dirty  accessed                         
0xff936000-0xff936fff  0x3f551000         4K        rw       present           dirty  accessed                         
0xff937000-0xff937fff  0x3e28a000         4K        rw       present           dirty  accessed                         
0xff938000-0xff938fff  0x3e288000         4K        rw       present           dirty  accessed                         
0xff939000-0xff939fff  0x3dcd3000         4K        rw       present           dirty  accessed                         
0xff93a000-0xff93afff  0x3ef3a000         4K        rw       present           dirty  accessed                         
0xff93b000-0xff93bfff  0x3ddb7000         4K        rw       present           dirty  accessed                         
0xff93c000-0xff93cfff  0x3dcb9000         4K        rw       present           dirty  accessed                         
0xff93d000-0xff93dfff  0x3ddb4000         4K        rw       present           dirty  accessed                         
0xff93e000-0xff93efff  0x3e37a000         4K        rw       present           dirty  accessed                         
0xff93f000-0xff93ffff  0x3e35d000         4K        rw       present           dirty  accessed                         
0xff940000-0xff940fff  0x3f528000         4K        rw       present           dirty  accessed                         
0xff941000-0xff941fff  0x3e2e3000         4K        rw       present           dirty  accessed                         
0xff942000-0xff942fff  0x3e49e000         4K        rw       present           dirty  accessed                         
0xff943000-0xff943fff  0x3ddd6000         4K        rw       present           dirty  accessed                         
0xff944000-0xff944fff  0x3ecc6000         4K        rw       present           dirty  accessed                         
0xff945000-0xff945fff  0x3dcac000         4K        rw       present           dirty  accessed                         
0xff946000-0xff946fff  0x3dd53000         4K        rw       present           dirty  accessed                         
0xff947000-0xff947fff  0x3e50d000         4K        rw       present           dirty  accessed                         
0xff948000-0xff948fff  0x3e0ae000         4K        rw       present           dirty  accessed                         
0xff949000-0xff949fff  0x3e4a1000         4K        rw       present           dirty  accessed                         
0xff94a000-0xff94afff  0x3e2f3000         4K        rw       present           dirty  accessed                         
0xff94b000-0xff94bfff  0x3dcb6000         4K        rw       present           dirty  accessed                         
0xff94c000-0xff94cfff  0x3e228000         4K        rw       present           dirty  accessed                         
0xff94d000-0xff94dfff  0x3e20f000         4K        rw       present           dirty  accessed                         
0xff94e000-0xff94efff  0x3e1eb000         4K        rw       present           dirty  accessed                         
0xff94f000-0xff94ffff  0x3edbf000         4K        rw       present           dirty  accessed                         
0xff950000-0xff950fff  0x3e7e3000         4K        rw       present           dirty  accessed                         
0xff951000-0xff951fff  0x3e3d7000         4K        rw       present           dirty  accessed                         
0xff952000-0xff952fff  0x3ddc5000         4K        rw       present           dirty  accessed                         
0xff953000-0xff953fff  0x3e0c1000         4K        rw       present           dirty  accessed                         
0xff954000-0xff954fff  0x3e4e3000         4K        rw       present           dirty  accessed                         
0xff955000-0xff955fff  0x3f547000         4K        rw       present           dirty  accessed                         
0xff956000-0xff956fff  0x3dc9b000         4K        rw       present           dirty  accessed                         
0xff957000-0xff957fff  0x3dcbb000         4K        rw       present           dirty  accessed                         
0xff958000-0xff958fff  0x3dcba000         4K        rw       present           dirty  accessed                         
0xff959000-0xff959fff  0x3e79c000         4K        rw       present           dirty  accessed                         
0xff95a000-0xff95afff  0x3e791000         4K        rw       present           dirty  accessed                         
0xff95b000-0xff95bfff  0x3e7bb000         4K        rw       present           dirty  accessed                         
0xff95c000-0xff95cfff  0x3e74d000         4K        rw       present           dirty  accessed                         
0xff95d000-0xff95dfff  0x3f1f0000         4K        rw       present           dirty  accessed                         
0xff95e000-0xff95efff  0x3e4c0000         4K        rw       present           dirty  accessed                         
0xff95f000-0xff95ffff  0x3f521000         4K        rw       present           dirty  accessed                         
0xff960000-0xff960fff  0x3ddc4000         4K        rw       present           dirty  accessed                         
0xff961000-0xff961fff  0x3dcb1000         4K        rw       present           dirty  accessed                         
0xff962000-0xff962fff  0x3f1e6000         4K        rw       present           dirty  accessed                         
0xff963000-0xff963fff  0x3e47a000         4K        rw       present           dirty  accessed                         
0xff964000-0xff964fff  0x3f1e5000         4K        rw       present           dirty  accessed                         
0xff965000-0xff965fff  0x3e475000         4K        rw       present           dirty  accessed                         
0xff966000-0xff966fff  0x3e953000         4K        rw       present           dirty  accessed                         
0xff967000-0xff967fff  0x3e457000         4K        rw       present           dirty  accessed                         
0xff968000-0xff968fff  0x3f522000         4K        rw       present           dirty  accessed                         
0xff969000-0xff969fff  0x3f1d4000         4K        rw       present           dirty  accessed                         
0xff96a000-0xff96afff  0x3f132000         4K        rw       present           dirty  accessed                         
0xff96b000-0xff96bfff  0x3efba000         4K        rw       present           dirty  accessed                         
0xff96c000-0xff96cfff  0x3ef53000         4K        rw       present           dirty  accessed                         
0xff96d000-0xff96dfff  0x3ece1000         4K        rw       present           dirty  accessed                         
0xff96e000-0xff96efff  0x3f1d3000         4K        rw       present           dirty  accessed                         
0xff96f000-0xff96ffff  0x3ef74000         4K        rw       present           dirty  accessed                         
0xff970000-0xff970fff  0x3e384000         4K        rw       present           dirty  accessed                         
0xff971000-0xff971fff  0x3edb0000         4K        rw       present           dirty  accessed                         
0xff972000-0xff972fff  0x3eee0000         4K        rw       present           dirty  accessed                         
0xff973000-0xff973fff  0x3f1d7000         4K        rw       present           dirty  accessed                         
0xff974000-0xff974fff  0x3ed11000         4K        rw       present           dirty  accessed                         
0xff975000-0xff975fff  0x3f140000         4K        rw       present           dirty  accessed                         
0xff976000-0xff976fff  0x3ed5c000         4K        rw       present           dirty  accessed                         
0xff977000-0xff977fff  0x3dd51000         4K        rw       present           dirty  accessed                         
0xff978000-0xff978fff  0x3e095000         4K        rw       present           dirty  accessed                         
0xff979000-0xff979fff  0x3e040000         4K        rw       present           dirty  accessed                         
0xff97a000-0xff97afff  0x3e647000         4K        rw       present           dirty  accessed                         
0xff97b000-0xff97bfff  0x3e1fa000         4K        rw       present           dirty  accessed                         
0xff97c000-0xff97cfff  0x3e5d3000         4K        rw       present           dirty  accessed                         
0xff97d000-0xff97dfff  0x3ddde000         4K        rw       present           dirty  accessed                         
0xff97e000-0xff97efff  0x3e251000         4K        rw       present           dirty  accessed                         
0xff97f000-0xff97ffff  0x3f51d000         4K        rw       present           dirty  accessed                         
0xff980000-0xff980fff  0x3ebd2000         4K        rw       present           dirty  accessed                         
0xff981000-0xff981fff  0x3e222000         4K        rw       present           dirty  accessed                         
0xff982000-0xff982fff  0x3e8a6000         4K        rw       present           dirty  accessed                         
0xff983000-0xff983fff  0x3e938000         4K        rw       present           dirty  accessed                         
0xff984000-0xff984fff  0x3edb3000         4K        rw       present           dirty  accessed                         
0xff985000-0xff985fff  0x3ee38000         4K        rw       present           dirty  accessed                         
0xff986000-0xff986fff  0x3ef76000         4K        rw       present           dirty  accessed                         
0xff987000-0xff987fff  0x3e78c000         4K        rw       present           dirty  accessed                         
0xff988000-0xff988fff  0x3ed0e000         4K        rw       present           dirty  accessed                         
0xff989000-0xff989fff  0x3edeb000         4K        rw       present           dirty  accessed                         
0xff98a000-0xff98afff  0x3ea26000         4K        rw       present           dirty  accessed                         
0xff98b000-0xff98bfff  0x3ed0b000         4K        rw       present           dirty  accessed                         
0xff98c000-0xff98cfff  0x3f18d000         4K        rw       present           dirty  accessed                         
0xff98d000-0xff98dfff  0x3f0dc000         4K        rw       present           dirty  accessed                         
0xff98e000-0xff98efff  0x3e53f000         4K        rw       present           dirty  accessed                         
0xff98f000-0xff98ffff  0x3e480000         4K        rw       present           dirty  accessed                         
0xff990000-0xff990fff  0x3ee67000         4K        rw       present           dirty  accessed                         
0xff991000-0xff991fff  0x3dca3000         4K        rw       present           dirty  accessed                         
0xff992000-0xff992fff  0x3e931000         4K        rw       present           dirty  accessed                         
0xff993000-0xff993fff  0x3ed5e000         4K        rw       present           dirty  accessed                         
0xff994000-0xff994fff  0x3ef9e000         4K        rw       present           dirty  accessed                         
0xff995000-0xff995fff  0x3e12c000         4K        rw       present           dirty  accessed                         
0xff996000-0xff996fff  0x3ed58000         4K        rw       present           dirty  accessed                         
0xff997000-0xff997fff  0x3e648000         4K        rw       present           dirty  accessed                         
0xff998000-0xff998fff  0x3dda2000         4K        rw       present           dirty  accessed                         
0xff999000-0xff999fff  0x3e490000         4K        rw       present           dirty  accessed                         
0xff99a000-0xff99afff  0x3e79d000         4K        rw       present           dirty  accessed                         
0xff99b000-0xff99bfff  0x3e7b6000         4K        rw       present           dirty  accessed                         
0xff99c000-0xff99cfff  0x3ddcb000         4K        rw       present           dirty  accessed                         
0xff99d000-0xff99dfff  0x3e634000         4K        rw       present           dirty  accessed                         
0xff99e000-0xff99efff  0x3e40e000         4K        rw       present           dirty  accessed                         
0xff99f000-0xff99ffff  0x3eaad000         4K        rw       present           dirty  accessed                         
0xff9a0000-0xff9a0fff  0x3f71b000         4K        rw       present           dirty  accessed                         
0xff9a1000-0xff9a1fff  0x3e62f000         4K        rw       present           dirty  accessed                         
0xff9a2000-0xff9a2fff  0x3e629000         4K        rw       present           dirty  accessed                         
0xff9a3000-0xff9a3fff  0x3e4c2000         4K        rw       present           dirty  accessed                         
0xff9a4000-0xff9a4fff  0x3f1c0000         4K        rw       present           dirty  accessed                         
0xff9a5000-0xff9a5fff  0x3e47f000         4K        rw       present           dirty  accessed                         
0xff9a6000-0xff9a6fff  0x3e87e000         4K        rw       present           dirty  accessed                         
0xff9a7000-0xff9a7fff  0x3e377000         4K        rw       present           dirty  accessed                         
0xff9a8000-0xff9a8fff  0x3ddcc000         4K        rw       present           dirty  accessed                         
0xff9a9000-0xff9a9fff  0x3e4bd000         4K        rw       present           dirty  accessed                         
0xff9aa000-0xff9aafff  0x3e7b0000         4K        rw       present           dirty  accessed                         
0xff9ab000-0xff9abfff  0x3e8fa000         4K        rw       present           dirty  accessed                         
0xff9ac000-0xff9acfff  0x3e190000         4K        rw       present           dirty  accessed                         
0xff9ad000-0xff9adfff  0x3dd91000         4K        rw       present           dirty  accessed                         
0xff9ae000-0xff9aefff  0x3e650000         4K        rw       present           dirty  accessed                         
0xff9af000-0xff9affff  0x3e78d000         4K        rw       present           dirty  accessed                         
0xff9b0000-0xff9b0fff  0x3e5e7000         4K        rw       present           dirty  accessed                         
0xff9b1000-0xff9b1fff  0x3f110000         4K        rw       present           dirty  accessed                         
0xff9b2000-0xff9b2fff  0x3dc8a000         4K        rw       present           dirty  accessed                         
0xff9b3000-0xff9b3fff  0x3e8a8000         4K        rw       present           dirty  accessed                         
0xff9b4000-0xff9b4fff  0x3ebd1000         4K        rw       present           dirty  accessed                         
0xff9b5000-0xff9b5fff  0x3edf0000         4K        rw       present           dirty  accessed                         
0xff9b6000-0xff9b6fff  0x3e88a000         4K        rw       present           dirty  accessed                         
0xff9b7000-0xff9b7fff  0x3e0a4000         4K        rw       present           dirty  accessed                         
0xff9b8000-0xff9b8fff  0x3ed28000         4K        rw       present           dirty  accessed                         
0xff9b9000-0xff9b9fff  0x3eab7000         4K        rw       present           dirty  accessed                         
0xff9ba000-0xff9bafff  0x3e381000         4K        rw       present           dirty  accessed                         
0xff9bb000-0xff9bbfff  0x3e78f000         4K        rw       present           dirty  accessed                         
0xff9bc000-0xff9bcfff  0x3dddb000         4K        rw       present           dirty  accessed                         
0xff9bd000-0xff9bdfff  0x3e2d8000         4K        rw       present           dirty  accessed                         
0xff9be000-0xff9befff  0x3eef3000         4K        rw       present           dirty  accessed                         
0xff9bf000-0xff9bffff  0x3ea24000         4K        rw       present           dirty  accessed                         
0xff9c0000-0xff9c0fff  0x3dd9a000         4K        rw       present           dirty  accessed                         
0xff9c1000-0xff9c1fff  0x3e7ac000         4K        rw       present           dirty  accessed                         
0xff9c2000-0xff9c2fff  0x3e94b000         4K        rw       present           dirty  accessed                         
0xff9c3000-0xff9c3fff  0x3ddd0000         4K        rw       present           dirty  accessed                         
0xff9c4000-0xff9c4fff  0x3eecb000         4K        rw       present           dirty  accessed                         
0xff9c5000-0xff9c5fff  0x3e7af000         4K        rw       present           dirty  accessed                         
0xff9c6000-0xff9c6fff  0x3ee64000         4K        rw       present           dirty  accessed                         
0xff9c7000-0xff9c7fff  0x3e7b9000         4K        rw       present           dirty  accessed                         
0xff9c8000-0xff9c8fff  0x3eeca000         4K        rw       present           dirty  accessed                         
0xff9c9000-0xff9c9fff  0x3e7be000         4K        rw       present           dirty  accessed                         
0xff9ca000-0xff9cafff  0x3e645000         4K        rw       present           dirty  accessed                         
0xff9cb000-0xff9ccfff  0x3e0a2000         8K        rw       present           dirty  accessed                         
0xff9cd000-0xff9cdfff  0x3e22e000         4K        rw       present           dirty  accessed                         
0xff9ce000-0xff9cefff  0x3ebd0000         4K        rw       present           dirty  accessed                         
0xff9cf000-0xff9cffff  0x3eada000         4K        rw       present           dirty  accessed                         
0xff9d0000-0xff9d0fff  0x3ddd7000         4K        rw       present           dirty  accessed                         
0xff9d1000-0xff9d1fff  0x3e7c8000         4K        rw       present           dirty  accessed                         
0xff9d2000-0xff9d2fff  0x3e7ae000         4K        rw       present           dirty  accessed                         
0xff9d3000-0xff9d3fff  0x3e7bc000         4K        rw       present           dirty  accessed                         
0xff9d4000-0xff9d4fff  0x3f125000         4K        rw       present           dirty  accessed                         
0xff9d5000-0xff9d5fff  0x3dcd2000         4K        rw       present           dirty  accessed                         
0xff9d6000-0xff9d6fff  0x3e7ab000         4K        rw       present           dirty  accessed                         
0xff9d7000-0xff9d7fff  0x3e7cf000         4K        rw       present           dirty  accessed                         
0xff9d8000-0xff9d8fff  0x3e904000         4K        rw       present           dirty  accessed                         
0xff9d9000-0xff9d9fff  0x3ea97000         4K        rw       present           dirty  accessed                         
0xff9da000-0xff9dafff  0x3ea04000         4K        rw       present           dirty  accessed                         
0xff9db000-0xff9dbfff  0x3efe5000         4K        rw       present           dirty  accessed                         
0xff9dc000-0xff9dcfff  0x3e843000         4K        rw       present           dirty  accessed                         
0xff9dd000-0xff9ddfff  0x3e46b000         4K        rw       present           dirty  accessed                         
0xff9de000-0xff9defff  0x3e5aa000         4K        rw       present           dirty  accessed                         
0xff9df000-0xff9dffff  0x3ea62000         4K        rw       present           dirty  accessed                         
0xff9e0000-0xff9e0fff  0x3eadc000         4K        rw       present           dirty  accessed                         
0xff9e1000-0xff9e1fff  0x3ebd5000         4K        rw       present           dirty  accessed                         
0xff9e2000-0xff9e2fff  0x3e8db000         4K        rw       present           dirty  accessed                         
0xff9e3000-0xff9e3fff  0x3eb39000         4K        rw       present           dirty  accessed                         
0xff9e4000-0xff9e4fff  0x3e908000         4K        rw       present           dirty  accessed                         
0xff9e5000-0xff9e5fff  0x3ea82000         4K        rw       present           dirty  accessed                         
0xff9e6000-0xff9e6fff  0x3ebdd000         4K        rw       present           dirty  accessed                         
0xff9e7000-0xff9e7fff  0x3e5a6000         4K        rw       present           dirty  accessed                         
0xff9e8000-0xff9e8fff  0x3ebd6000         4K        rw       present           dirty  accessed                         
0xff9e9000-0xff9e9fff  0x3e913000         4K        rw       present           dirty  accessed                         
0xff9ea000-0xff9eafff  0x3eebc000         4K        rw       present           dirty  accessed                         
0xff9eb000-0xff9ebfff  0x3eade000         4K        rw       present           dirty  accessed                         
0xff9ec000-0xff9ecfff  0x3e943000         4K        rw       present           dirty  accessed                         
0xff9ed000-0xff9edfff  0x3ea7a000         4K        rw       present           dirty  accessed                         
0xff9ee000-0xff9eefff  0x3ed3b000         4K        rw       present           dirty  accessed                         
0xff9ef000-0xff9effff  0x3e5bf000         4K        rw       present           dirty  accessed                         
0xff9f0000-0xff9f0fff  0x3e79e000         4K        rw       present           dirty  accessed                         
0xff9f1000-0xff9f1fff  0x3e495000         4K        rw       present           dirty  accessed                         
0xff9f2000-0xff9f2fff  0x3e78a000         4K        rw       present           dirty  accessed                         
0xff9f3000-0xff9f3fff  0x3eded000         4K        rw       present           dirty  accessed                         
0xff9f4000-0xff9f4fff  0x3e621000         4K        rw       present           dirty  accessed                         
0xff9f5000-0xff9f5fff  0x3ea83000         4K        rw       present           dirty  accessed                         
0xff9f6000-0xff9f6fff  0x3ea95000         4K        rw       present           dirty  accessed                         
0xff9f7000-0xff9f7fff  0x3ef8f000         4K        rw       present           dirty  accessed                         
0xff9f8000-0xff9f8fff  0x3e5bc000         4K        rw       present           dirty  accessed                         
0xff9f9000-0xff9f9fff  0x3ef01000         4K        rw       present           dirty  accessed                         
0xff9fa000-0xff9fafff  0x3dc92000         4K        rw       present           dirty  accessed                         
0xff9fb000-0xff9fbfff  0x3e54c000         4K        rw       present           dirty  accessed                         
0xff9fc000-0xff9fcfff  0x3e507000         4K        rw       present           dirty  accessed                         
0xff9fd000-0xff9fdfff  0x3e71d000         4K        rw       present           dirty  accessed                         
0xff9fe000-0xff9fefff  0x3e732000         4K        rw       present           dirty  accessed                         
0xff9ff000-0xff9fffff  0x3eb9c000         4K        rw       present           dirty  accessed                         
0xffa00000-0xffa00fff  0x3de01000         4K        rw       present           dirty  accessed                         
0xffa01000-0xffa01fff  0x3de0c000         4K        rw       present           dirty  accessed                         
0xffa02000-0xffa02fff  0x3de13000         4K        rw       present           dirty  accessed                         
0xffa03000-0xffa03fff  0x3de16000         4K        rw       present           dirty  accessed                         
0xffa04000-0xffa04fff  0x3de08000         4K        rw       present           dirty  accessed                         
0xffa05000-0xffa05fff  0x3de2f000         4K        rw       present           dirty  accessed                         
0xffa06000-0xffa06fff  0x3e721000         4K        rw       present           dirty  accessed                         
0xffa07000-0xffa07fff  0x3dca8000         4K        rw       present           dirty  accessed                         
0xffa08000-0xffa08fff  0x3de05000         4K        rw       present           dirty  accessed                         
0xffa09000-0xffa09fff  0x3ea9f000         4K        rw       present           dirty  accessed                         
0xffa0a000-0xffa0afff  0x3e73a000         4K        rw       present           dirty  accessed                         
0xffa0b000-0xffa0bfff  0x3e783000         4K        rw       present           dirty  accessed                         
0xffa0c000-0xffa0cfff  0x3de1e000         4K        rw       present           dirty  accessed                         
0xffa0d000-0xffa0dfff  0x3de25000         4K        rw       present           dirty  accessed                         
0xffa0e000-0xffa0efff  0x3de4a000         4K        rw       present           dirty  accessed                         
0xffa0f000-0xffa0ffff  0x3de58000         4K        rw       present           dirty  accessed                         
0xffa10000-0xffa10fff  0x3de2d000         4K        rw       present           dirty  accessed                         
0xffa11000-0xffa11fff  0x3de17000         4K        rw       present           dirty  accessed                         
0xffa12000-0xffa12fff  0x3de0d000         4K        rw       present           dirty  accessed                         
0xffa13000-0xffa13fff  0x3edec000         4K        rw       present           dirty  accessed                         
0xffa14000-0xffa14fff  0x3e65f000         4K        rw       present           dirty  accessed                         
0xffa15000-0xffa15fff  0x3e8f7000         4K        rw       present           dirty  accessed                         
0xffa16000-0xffa16fff  0x3de03000         4K        rw       present           dirty  accessed                         
0xffa17000-0xffa17fff  0x3de32000         4K        rw       present           dirty  accessed                         
0xffa18000-0xffa18fff  0x3de57000         4K        rw       present           dirty  accessed                         
0xffa19000-0xffa19fff  0x3de5e000         4K        rw       present           dirty  accessed                         
0xffa1a000-0xffa1afff  0x3de48000         4K        rw       present           dirty  accessed                         
0xffa1b000-0xffa1bfff  0x3de67000         4K        rw       present           dirty  accessed                         
0xffa1c000-0xffa1cfff  0x3e434000         4K        rw       present           dirty  accessed                         
0xffa1d000-0xffa1dfff  0x3de21000         4K        rw       present           dirty  accessed                         
0xffa1e000-0xffa1efff  0x3eb88000         4K        rw       present           dirty  accessed                         
0xffa1f000-0xffa1ffff  0x3de09000         4K        rw       present           dirty  accessed                         
0xffa20000-0xffa20fff  0x3ebbe000         4K        rw       present           dirty  accessed                         
0xffa21000-0xffa21fff  0x3de63000         4K        rw       present           dirty  accessed                         
0xffa22000-0xffa22fff  0x3de45000         4K        rw       present           dirty  accessed                         
0xffa23000-0xffa23fff  0x3dfc3000         4K        rw       present           dirty  accessed                         
0xffa24000-0xffa24fff  0x3d801000         4K        rw       present           dirty  accessed                         
0xffa25000-0xffa25fff  0x3d803000         4K        rw       present           dirty  accessed                         
0xffa26000-0xffa26fff  0x3dffd000         4K        rw       present           dirty  accessed                         
0xffa27000-0xffa27fff  0x3d819000         4K        rw       present           dirty  accessed                         
0xffa28000-0xffa28fff  0x3d809000         4K        rw       present           dirty  accessed                         
0xffa29000-0xffa29fff  0x3d82a000         4K        rw       present           dirty  accessed                         
0xffa2a000-0xffa2afff  0x3dfff000         4K        rw       present           dirty  accessed                         
0xffa2b000-0xffa2bfff  0x3e5a7000         4K        rw       present           dirty  accessed                         
0xffa2c000-0xffa2cfff  0x3dec6000         4K        rw       present           dirty  accessed                         
0xffa2d000-0xffa2dfff  0x3df01000         4K        rw       present           dirty  accessed                         
0xffa2e000-0xffa2efff  0x3d83e000         4K        rw       present           dirty  accessed                         
0xffa2f000-0xffa2ffff  0x3dea1000         4K        rw       present           dirty  accessed                         
0xffa30000-0xffa30fff  0x3dec7000         4K        rw       present           dirty  accessed                         
0xffa31000-0xffa31fff  0x3eb9f000         4K        rw       present           dirty  accessed                         
0xffa32000-0xffa32fff  0x3ea79000         4K        rw       present           dirty  accessed                         
0xffa33000-0xffa33fff  0x3dfe6000         4K        rw       present           dirty  accessed                         
0xffa34000-0xffa34fff  0x3df72000         4K        rw       present           dirty  accessed                         
0xffa35000-0xffa35fff  0x3df41000         4K        rw       present           dirty  accessed                         
0xffa36000-0xffa36fff  0x3de80000         4K        rw       present           dirty  accessed                         
0xffa37000-0xffa37fff  0x3dfb3000         4K        rw       present           dirty  accessed                         
0xffa38000-0xffa38fff  0x3dff7000         4K        rw       present           dirty  accessed                         
0xffa39000-0xffa39fff  0x3d81a000         4K        rw       present           dirty  accessed                         
0xffa3a000-0xffa3afff  0x3ea96000         4K        rw       present           dirty  accessed                         
0xffa3b000-0xffa3bfff  0x3eed2000         4K        rw       present           dirty  accessed                         
0xffa3c000-0xffa3cfff  0x3de26000         4K        rw       present           dirty  accessed                         
0xffa3d000-0xffa3dfff  0x3ea0b000         4K        rw       present           dirty  accessed                         
0xffa3e000-0xffa3efff  0x3e842000         4K        rw       present           dirty  accessed                         
0xffa3f000-0xffa3ffff  0x3ea0a000         4K        rw       present           dirty  accessed                         
0xffa40000-0xffa40fff  0x3eecc000         4K        rw       present           dirty  accessed                         
0xffa41000-0xffa41fff  0x3e5a4000         4K        rw       present           dirty  accessed                         
0xffa42000-0xffa42fff  0x3f10b000         4K        rw       present           dirty  accessed                         
0xffa43000-0xffa43fff  0x3e221000         4K        rw       present           dirty  accessed                         
0xffa44000-0xffa44fff  0x3e468000         4K        rw       present           dirty  accessed                         
0xffa45000-0xffa45fff  0x3eb8d000         4K        rw       present           dirty  accessed                         
0xffa46000-0xffa46fff  0x3eecd000         4K        rw       present           dirty  accessed                         
0xffa47000-0xffa47fff  0x3d81c000         4K        rw       present           dirty  accessed                         
0xffa48000-0xffa48fff  0x3e435000         4K        rw       present           dirty  accessed                         
0xffa49000-0xffa49fff  0x3eece000         4K        rw       present           dirty  accessed                         
0xffa4a000-0xffa4afff  0x3de27000         4K        rw       present           dirty  accessed                         
0xffa4b000-0xffa4bfff  0x3e5b5000         4K        rw       present           dirty  accessed                         
0xffa4c000-0xffa4cfff  0x3e45f000         4K        rw       present           dirty  accessed                         
0xffa4d000-0xffa4dfff  0x3de62000         4K        rw       present           dirty  accessed                         
0xffa4e000-0xffa4efff  0x3eb85000         4K        rw       present           dirty  accessed                         
0xffa4f000-0xffa4ffff  0x3de24000         4K        rw       present           dirty  accessed                         
0xffa50000-0xffa50fff  0x3e5b4000         4K        rw       present           dirty  accessed                         
0xffa51000-0xffa51fff  0x3e7bf000         4K        rw       present           dirty  accessed                         
0xffa52000-0xffa52fff  0x3f102000         4K        rw       present           dirty  accessed                         
0xffa53000-0xffa53fff  0x3dfea000         4K        rw       present           dirty  accessed                         
0xffa54000-0xffa54fff  0x3de4f000         4K        rw       present           dirty  accessed                         
0xffa55000-0xffa55fff  0x3ea7b000         4K        rw       present           dirty  accessed                         
0xffa56000-0xffa56fff  0x3ed16000         4K        rw       present           dirty  accessed                         
0xffa57000-0xffa57fff  0x3e7bd000         4K        rw       present           dirty  accessed                         
0xffa58000-0xffa58fff  0x3d81e000         4K        rw       present           dirty  accessed                         
0xffa59000-0xffa59fff  0x3df71000         4K        rw       present           dirty  accessed                         
0xffa5a000-0xffa5afff  0x3ea07000         4K        rw       present           dirty  accessed                         
0xffa5b000-0xffa5bfff  0x3d808000         4K        rw       present           dirty  accessed                         
0xffa5c000-0xffa5cfff  0x3dfd9000         4K        rw       present           dirty  accessed                         
0xffa5d000-0xffa5dfff  0x3d83d000         4K        rw       present           dirty  accessed                         
0xffa5e000-0xffa5efff  0x3eed1000         4K        rw       present           dirty  accessed                         
0xffa5f000-0xffa5ffff  0x3d83c000         4K        rw       present           dirty  accessed                         
0xffa60000-0xffa60fff  0x3d804000         4K        rw       present           dirty  accessed                         
0xffa61000-0xffa61fff  0x3dfee000         4K        rw       present           dirty  accessed                         
0xffa62000-0xffa62fff  0x3d82e000         4K        rw       present           dirty  accessed                         
0xffa63000-0xffa63fff  0x3de7e000         4K        rw       present           dirty  accessed                         
0xffa64000-0xffa64fff  0x3dfb4000         4K        rw       present           dirty  accessed                         
0xffa65000-0xffa65fff  0x3d805000         4K        rw       present           dirty  accessed                         
0xffa66000-0xffa66fff  0x3de7a000         4K        rw       present           dirty  accessed                         
0xffa67000-0xffa67fff  0x3dfb0000         4K        rw       present           dirty  accessed                         
0xffa68000-0xffa68fff  0x3df96000         4K        rw       present           dirty  accessed                         
0xffa69000-0xffa69fff  0x3d814000         4K        rw       present           dirty  accessed                         
0xffa6a000-0xffa6afff  0x3dfb6000         4K        rw       present           dirty  accessed                         
0xffa6b000-0xffa6bfff  0x3ea65000         4K        rw       present           dirty  accessed                         
0xffa6c000-0xffa6cfff  0x3f515000         4K        rw       present           dirty  accessed                         
0xffa6d000-0xffa6dfff  0x3f4fb000         4K        rw       present           dirty  accessed                         
0xffa6e000-0xffa6efff  0x3eecf000         4K        rw       present           dirty  accessed                         
0xffa6f000-0xffa6ffff  0x3f506000         4K        rw       present           dirty  accessed                         
0xffa70000-0xffa70fff  0x3d842000         4K        rw       present           dirty  accessed                         
0xffa71000-0xffa71fff  0x3f509000         4K        rw       present           dirty  accessed                         
0xffa72000-0xffa72fff  0x3dfc7000         4K        rw       present           dirty  accessed                         
0xffa73000-0xffa73fff  0x3d859000         4K        rw       present           dirty  accessed                         
0xffa74000-0xffa74fff  0x3d866000         4K        rw       present           dirty  accessed                         
0xffa75000-0xffa75fff  0x3d84b000         4K        rw       present           dirty  accessed                         
0xffa76000-0xffa76fff  0x3d863000         4K        rw       present           dirty  accessed                         
0xffa77000-0xffa77fff  0x3d86e000         4K        rw       present           dirty  accessed                         
0xffa78000-0xffa78fff  0x3d86c000         4K        rw       present           dirty  accessed                         
0xffa79000-0xffa79fff  0x3d860000         4K        rw       present           dirty  accessed                         
0xffa7a000-0xffa7bfff  0x3d874000         8K        rw       present           dirty  accessed                         
0xffa7c000-0xffa7cfff  0x3d861000         4K        rw       present           dirty  accessed                         
0xffa7d000-0xffa7dfff  0x3d87b000         4K        rw       present           dirty  accessed                         
0xffa7e000-0xffa7efff  0x3d878000         4K        rw       present           dirty  accessed                         
0xffa7f000-0xffa7ffff  0x3d8ad000         4K        rw       present           dirty  accessed                         
0xffa80000-0xffa80fff  0x3d870000         4K        rw       present           dirty  accessed                         
0xffa81000-0xffa81fff  0x3d882000         4K        rw       present           dirty  accessed                         
0xffa82000-0xffa82fff  0x3d8b1000         4K        rw       present           dirty  accessed                         
0xffa83000-0xffa83fff  0x3dfca000         4K        rw       present           dirty  accessed                         
0xffa84000-0xffa84fff  0x3d879000         4K        rw       present           dirty  accessed                         
0xffa85000-0xffa85fff  0x3f50d000         4K        rw       present           dirty  accessed                         
0xffa86000-0xffa86fff  0x3d8a8000         4K        rw       present           dirty  accessed                         
0xffa87000-0xffa87fff  0x3d8b0000         4K        rw       present           dirty  accessed                         
0xffa88000-0xffa88fff  0x3dfc4000         4K        rw       present           dirty  accessed                         
0xffa89000-0xffa89fff  0x3d84a000         4K        rw       present           dirty  accessed                         
0xffa8a000-0xffa8afff  0x3d8a0000         4K        rw       present           dirty  accessed                         
0xffa8b000-0xffa8bfff  0x3d8b9000         4K        rw       present           dirty  accessed                         
0xffa8c000-0xffa8cfff  0x3d893000         4K        rw       present           dirty  accessed                         
0xffa8d000-0xffa8dfff  0x3da76000         4K        rw       present           dirty  accessed                         
0xffa8e000-0xffa8efff  0x3daab000         4K        rw       present           dirty  accessed                         
0xffa8f000-0xffa8ffff  0x3dabf000         4K        rw       present           dirty  accessed                         
0xffa90000-0xffa90fff  0x3dacc000         4K        rw       present           dirty  accessed                         
0xffa91000-0xffa91fff  0x3dad7000         4K        rw       present           dirty  accessed                         
0xffa92000-0xffa92fff  0x3dac2000         4K        rw       present           dirty  accessed                         
0xffa93000-0xffa93fff  0x3dad4000         4K        rw       present           dirty  accessed                         
0xffa94000-0xffa94fff  0x3dac6000         4K        rw       present           dirty  accessed                         
0xffa95000-0xffa95fff  0x3dad8000         4K        rw       present           dirty  accessed                         
0xffa96000-0xffa96fff  0x3dace000         4K        rw       present           dirty  accessed                         
0xffa97000-0xffa97fff  0x3dac4000         4K        rw       present           dirty  accessed                         
0xffa98000-0xffa98fff  0x3dada000         4K        rw       present           dirty  accessed                         
0xffa99000-0xffa99fff  0x3dabd000         4K        rw       present           dirty  accessed                         
0xffa9a000-0xffa9afff  0x3f50c000         4K        rw       present           dirty  accessed                         
0xffa9b000-0xffa9bfff  0x3dad3000         4K        rw       present           dirty  accessed                         
0xffa9c000-0xffa9cfff  0x3dacd000         4K        rw       present           dirty  accessed                         
0xffa9d000-0xffa9dfff  0x3dafa000         4K        rw       present           dirty  accessed                         
0xffa9e000-0xffa9efff  0x3db50000         4K        rw       present           dirty  accessed                         
0xffa9f000-0xffa9ffff  0x3db49000         4K        rw       present           dirty  accessed                         
0xffaa0000-0xffaa0fff  0x3db4f000         4K        rw       present           dirty  accessed                         
0xffaa1000-0xffaa1fff  0x3db58000         4K        rw       present           dirty  accessed                         
0xffaa2000-0xffaa2fff  0x3db53000         4K        rw       present           dirty  accessed                         
0xffaa3000-0xffaa3fff  0x3db48000         4K        rw       present           dirty  accessed                         
0xffaa4000-0xffaa4fff  0x3db57000         4K        rw       present           dirty  accessed                         
0xffaa5000-0xffaa5fff  0x3db59000         4K        rw       present           dirty  accessed                         
0xffaa6000-0xffaa6fff  0x3d9ed000         4K        rw       present           dirty  accessed                         
0xffaa7000-0xffaa7fff  0x3db4e000         4K        rw       present           dirty  accessed                         
0xffaa8000-0xffaa8fff  0x3db4a000         4K        rw       present           dirty  accessed                         
0xffaa9000-0xffaa9fff  0x3db5d000         4K        rw       present           dirty  accessed                         
0xffaaa000-0xffaaafff  0x3db4d000         4K        rw       present           dirty  accessed                         
0xffaab000-0xffaabfff  0x3db7d000         4K        rw       present           dirty  accessed                         
0xffaac000-0xffaacfff  0x3db86000         4K        rw       present           dirty  accessed                         
0xffaad000-0xffaadfff  0x3db7a000         4K        rw       present           dirty  accessed                         
0xffaae000-0xffaaefff  0x3db8f000         4K        rw       present           dirty  accessed                         
0xffaaf000-0xffaaffff  0x3dba8000         4K        rw       present           dirty  accessed                         
0xffab0000-0xffab0fff  0x3db56000         4K        rw       present           dirty  accessed                         
0xffab1000-0xffab1fff  0x3dbba000         4K        rw       present           dirty  accessed                         
0xffab2000-0xffab2fff  0x3dbc3000         4K        rw       present           dirty  accessed                         
0xffab3000-0xffab3fff  0x3dbb1000         4K        rw       present           dirty  accessed                         
0xffab4000-0xffab4fff  0x3db80000         4K        rw       present           dirty  accessed                         
0xffab5000-0xffab5fff  0x3db62000         4K        rw       present           dirty  accessed                         
0xffab6000-0xffab6fff  0x3dbcd000         4K        rw       present           dirty  accessed                         
0xffab7000-0xffab7fff  0x3dbbd000         4K        rw       present           dirty  accessed                         
0xffab8000-0xffab8fff  0x3db7b000         4K        rw       present           dirty  accessed                         
0xffab9000-0xffab9fff  0x3dbac000         4K        rw       present           dirty  accessed                         
0xffaba000-0xffabafff  0x3db8c000         4K        rw       present           dirty  accessed                         
0xffabb000-0xffabbfff  0x3db81000         4K        rw       present           dirty  accessed                         
0xffabc000-0xffabcfff  0x3dbb3000         4K        rw       present           dirty  accessed                         
0xffabd000-0xffabdfff  0x3db69000         4K        rw       present           dirty  accessed                         
0xffabe000-0xffabefff  0x3dba7000         4K        rw       present           dirty  accessed                         
0xffabf000-0xffabffff  0x3dbe0000         4K        rw       present           dirty  accessed                         
0xffac0000-0xffac0fff  0x3dbd5000         4K        rw       present           dirty  accessed                         
0xffac1000-0xffac1fff  0x3db46000         4K        rw       present           dirty  accessed                         
0xffac2000-0xffac2fff  0x3dbd2000         4K        rw       present           dirty  accessed                         
0xffac3000-0xffac3fff  0x3dbab000         4K        rw       present           dirty  accessed                         
0xffac4000-0xffac4fff  0x3db51000         4K        rw       present           dirty  accessed                         
0xffac5000-0xffac5fff  0x3dbd8000         4K        rw       present           dirty  accessed                         
0xffac6000-0xffac6fff  0x3dbec000         4K        rw       present           dirty  accessed                         
0xffac7000-0xffac7fff  0x3dbdb000         4K        rw       present           dirty  accessed                         
0xffac8000-0xffac8fff  0x3d8aa000         4K        rw       present           dirty  accessed                         
0xffac9000-0xffac9fff  0x3dbc5000         4K        rw       present           dirty  accessed                         
0xffaca000-0xffacbfff  0x3dbe3000         8K        rw       present           dirty  accessed                         
0xffacc000-0xffaccfff  0x3dbeb000         4K        rw       present           dirty  accessed                         
0xffacd000-0xffacdfff  0x3dfc1000         4K        rw       present           dirty  accessed                         
0xfface000-0xffacefff  0x3dbe5000         4K        rw       present           dirty  accessed                         
0xffacf000-0xffacffff  0x3dbf7000         4K        rw       present           dirty  accessed                         
0xffad0000-0xffad0fff  0x3dbfc000         4K        rw       present           dirty  accessed                         
0xffad1000-0xffad1fff  0x3d409000         4K        rw       present           dirty  accessed                         
0xffad2000-0xffad2fff  0x3dbf8000         4K        rw       present           dirty  accessed                         
0xffad3000-0xffad3fff  0x3d516000         4K        rw       present           dirty  accessed                         
0xffad4000-0xffad4fff  0x3d53a000         4K        rw       present           dirty  accessed                         
0xffad5000-0xffad5fff  0x3d538000         4K        rw       present           dirty  accessed                         
0xffad6000-0xffad6fff  0x3d526000         4K        rw       present           dirty  accessed                         
0xffad7000-0xffad7fff  0x3d51a000         4K        rw       present           dirty  accessed                         
0xffad8000-0xffad8fff  0x3d519000         4K        rw       present           dirty  accessed                         
0xffad9000-0xffad9fff  0x3d533000         4K        rw       present           dirty  accessed                         
0xffada000-0xffadafff  0x3d521000         4K        rw       present           dirty  accessed                         
0xffadb000-0xffadbfff  0x3d524000         4K        rw       present           dirty  accessed                         
0xffadc000-0xffadcfff  0x3d51f000         4K        rw       present           dirty  accessed                         
0xffadd000-0xffaddfff  0x3d534000         4K        rw       present           dirty  accessed                         
0xffade000-0xffadefff  0x3d536000         4K        rw       present           dirty  accessed                         
0xffadf000-0xffadffff  0x3dfc9000         4K        rw       present           dirty  accessed                         
0xffae0000-0xffae0fff  0x3d53c000         4K        rw       present           dirty  accessed                         
0xffae1000-0xffae1fff  0x3d518000         4K        rw       present           dirty  accessed                         
0xffae2000-0xffae2fff  0x3d543000         4K        rw       present           dirty  accessed                         
0xffae3000-0xffae3fff  0x3d54b000         4K        rw       present           dirty  accessed                         
0xffae4000-0xffae4fff  0x3d569000         4K        rw       present           dirty  accessed                         
0xffae5000-0xffae5fff  0x3d537000         4K        rw       present           dirty  accessed                         
0xffae6000-0xffae6fff  0x3d580000         4K        rw       present           dirty  accessed                         
0xffae7000-0xffae7fff  0x3d571000         4K        rw       present           dirty  accessed                         
0xffae8000-0xffae8fff  0x3d565000         4K        rw       present           dirty  accessed                         
0xffae9000-0xffae9fff  0x3d56e000         4K        rw       present           dirty  accessed                         
0xffaea000-0xffaeafff  0x3d57c000         4K        rw       present           dirty  accessed                         
0xffaeb000-0xffaebfff  0x3d545000         4K        rw       present           dirty  accessed                         
0xffaec000-0xffaecfff  0x3d563000         4K        rw       present           dirty  accessed                         
0xffaed000-0xffaedfff  0x3d577000         4K        rw       present           dirty  accessed                         
0xffaee000-0xffaeefff  0x3d586000         4K        rw       present           dirty  accessed                         
0xffaef000-0xffaeffff  0x3d584000         4K        rw       present           dirty  accessed                         
0xffaf0000-0xffaf0fff  0x3d57b000         4K        rw       present           dirty  accessed                         
0xffaf1000-0xffaf1fff  0x3d567000         4K        rw       present           dirty  accessed                         
0xffaf2000-0xffaf2fff  0x3d56a000         4K        rw       present           dirty  accessed                         
0xffaf3000-0xffaf3fff  0x3d596000         4K        rw       present           dirty  accessed                         
0xffaf4000-0xffaf4fff  0x3d588000         4K        rw       present           dirty  accessed                         
0xffaf5000-0xffaf5fff  0x3d568000         4K        rw       present           dirty  accessed                         
0xffaf6000-0xffaf6fff  0x3d587000         4K        rw       present           dirty  accessed                         
0xffaf7000-0xffaf7fff  0x3d6e0000         4K        rw       present           dirty  accessed                         
0xffaf8000-0xffaf8fff  0x3d6fd000         4K        rw       present           dirty  accessed                         
0xffaf9000-0xffaf9fff  0x3d721000         4K        rw       present           dirty  accessed                         
0xffafa000-0xffafafff  0x3d72f000         4K        rw       present           dirty  accessed                         
0xffafb000-0xffafbfff  0x3d724000         4K        rw       present           dirty  accessed                         
0xffafc000-0xffafcfff  0x3d6dd000         4K        rw       present           dirty  accessed                         
0xffafd000-0xffafdfff  0x3d730000         4K        rw       present           dirty  accessed                         
0xffafe000-0xffafefff  0x3d72a000         4K        rw       present           dirty  accessed                         
0xffaff000-0xffafffff  0x3d6e7000         4K        rw       present           dirty  accessed                         
0xffb00000-0xffb00fff  0x3d720000         4K        rw       present           dirty  accessed                         
0xffb01000-0xffb01fff  0x3d706000         4K        rw       present           dirty  accessed                         
0xffb02000-0xffb02fff  0x3d700000         4K        rw       present           dirty  accessed                         
0xffb03000-0xffb03fff  0x3d888000         4K        rw       present           dirty  accessed                         
0xffb04000-0xffb04fff  0x3d73a000         4K        rw       present           dirty  accessed                         
0xffb05000-0xffb05fff  0x3d729000         4K        rw       present           dirty  accessed                         
0xffb06000-0xffb06fff  0x3d745000         4K        rw       present           dirty  accessed                         
0xffb07000-0xffb07fff  0x3d750000         4K        rw       present           dirty  accessed                         
0xffb08000-0xffb08fff  0x3d701000         4K        rw       present           dirty  accessed                         
0xffb09000-0xffb09fff  0x3d6e6000         4K        rw       present           dirty  accessed                         
0xffb0a000-0xffb0afff  0x3d754000         4K        rw       present           dirty  accessed                         
0xffb0b000-0xffb0bfff  0x3d025000         4K        rw       present           dirty  accessed                         
0xffb0c000-0xffb0cfff  0x3d031000         4K        rw       present           dirty  accessed                         
0xffb0d000-0xffb0dfff  0x3d038000         4K        rw       present           dirty  accessed                         
0xffb0e000-0xffb0efff  0x3d03c000         4K        rw       present           dirty  accessed                         
0xffb0f000-0xffb0ffff  0x3d03e000         4K        rw       present           dirty  accessed                         
0xffb10000-0xffb10fff  0x3d022000         4K        rw       present           dirty  accessed                         
0xffb11000-0xffb11fff  0x3d054000         4K        rw       present           dirty  accessed                         
0xffb12000-0xffb12fff  0x3d051000         4K        rw       present           dirty  accessed                         
0xffb13000-0xffb13fff  0x3d043000         4K        rw       present           dirty  accessed                         
0xffb14000-0xffb14fff  0x3d04b000         4K        rw       present           dirty  accessed                         
0xffb15000-0xffb15fff  0x3d04e000         4K        rw       present           dirty  accessed                         
0xffb16000-0xffb16fff  0x3d03a000         4K        rw       present           dirty  accessed                         
0xffb17000-0xffb17fff  0x3d04f000         4K        rw       present           dirty  accessed                         
0xffb18000-0xffb18fff  0x3dbef000         4K        rw       present           dirty  accessed                         
0xffb19000-0xffb19fff  0x3d029000         4K        rw       present           dirty  accessed                         
0xffb1a000-0xffb1afff  0x3d56f000         4K        rw       present           dirty  accessed                         
0xffb1b000-0xffb1bfff  0x3d065000         4K        rw       present           dirty  accessed                         
0xffb1c000-0xffb1cfff  0x3d05d000         4K        rw       present           dirty  accessed                         
0xffb1d000-0xffb1dfff  0x3d04d000         4K        rw       present           dirty  accessed                         
0xffb1e000-0xffb1efff  0x3d08a000         4K        rw       present           dirty  accessed                         
0xffb1f000-0xffb1ffff  0x3d279000         4K        rw       present           dirty  accessed                         
0xffb20000-0xffb20fff  0x3d277000         4K        rw       present           dirty  accessed                         
0xffb21000-0xffb21fff  0x3d285000         4K        rw       present           dirty  accessed                         
0xffb22000-0xffb22fff  0x3d284000         4K        rw       present           dirty  accessed                         
0xffb23000-0xffb23fff  0x3d270000         4K        rw       present           dirty  accessed                         
0xffb24000-0xffb24fff  0x3d32c000         4K        rw       present           dirty  accessed                         
0xffb25000-0xffb25fff  0x3d202000         4K        rw       present           dirty  accessed                         
0xffb26000-0xffb26fff  0x3d368000         4K        rw       present           dirty  accessed                         
0xffb27000-0xffb27fff  0x3d36d000         4K        rw       present           dirty  accessed                         
0xffb28000-0xffb28fff  0x3d096000         4K        rw       present           dirty  accessed                         
0xffb29000-0xffb29fff  0x3d385000         4K        rw       present           dirty  accessed                         
0xffb2a000-0xffb2afff  0x3d372000         4K        rw       present           dirty  accessed                         
0xffb2b000-0xffb2bfff  0x3d36b000         4K        rw       present           dirty  accessed                         
0xffb2c000-0xffb2cfff  0x3d364000         4K        rw       present           dirty  accessed                         
0xffb2d000-0xffb2dfff  0x3d37c000         4K        rw       present           dirty  accessed                         
0xffb2e000-0xffb2efff  0x3d379000         4K        rw       present           dirty  accessed                         
0xffb2f000-0xffb2ffff  0x3d369000         4K        rw       present           dirty  accessed                         
0xffb30000-0xffb30fff  0x3d37e000         4K        rw       present           dirty  accessed                         
0xffb31000-0xffb31fff  0x3d381000         4K        rw       present           dirty  accessed                         
0xffb32000-0xffb32fff  0x3d36f000         4K        rw       present           dirty  accessed                         
0xffb33000-0xffb33fff  0x3d378000         4K        rw       present           dirty  accessed                         
0xffb34000-0xffb34fff  0x3d366000         4K        rw       present           dirty  accessed                         
0xffb35000-0xffb35fff  0x3f508000         4K        rw       present           dirty  accessed                         
0xffb36000-0xffb36fff  0x3d062000         4K        rw       present           dirty  accessed                         
0xffb37000-0xffb37fff  0x3d380000         4K        rw       present           dirty  accessed                         
0xffb38000-0xffb38fff  0x3d387000         4K        rw       present           dirty  accessed                         
0xffb39000-0xffb39fff  0x3d367000         4K        rw       present           dirty  accessed                         
0xffb3a000-0xffb3afff  0x3d3a7000         4K        rw       present           dirty  accessed                         
0xffb3b000-0xffb3bfff  0x3d3bd000         4K        rw       present           dirty  accessed                         
0xffb3c000-0xffb3cfff  0x3d3d0000         4K        rw       present           dirty  accessed                         
0xffb3d000-0xffb3dfff  0x3d38e000         4K        rw       present           dirty  accessed                         
0xffb3e000-0xffb3efff  0x3d806000         4K        rw       present           dirty  accessed                         
0xffb3f000-0xffb3ffff  0x3dfd8000         4K        rw       present           dirty  accessed                         
0xffb40000-0xffb40fff  0x3f4fe000         4K        rw       present           dirty  accessed                         
0xffb41000-0xffb41fff  0x3cc49000         4K        rw       present           dirty  accessed                         
0xffb42000-0xffb42fff  0x3e7f3000         4K        rw       present           dirty  accessed                         
0xffb43000-0xffb43fff  0x3cdac000         4K        rw       present           dirty  accessed                         
0xffb44000-0xffb44fff  0x3cd60000         4K        rw       present           dirty  accessed                         
0xffb45000-0xffb45fff  0x3e56a000         4K        rw       present           dirty  accessed                         
0xffb46000-0xffb46fff  0x3e56c000         4K        rw       present           dirty  accessed                         
0xffb47000-0xffb47fff  0x3cdc3000         4K        rw       present           dirty  accessed                         
0xffb48000-0xffb48fff  0x3cdd9000         4K        rw       present           dirty  accessed                         
0xffb49000-0xffb49fff  0x3ce16000         4K        rw       present           dirty  accessed                         
0xffb4a000-0xffb4afff  0x3ce40000         4K        rw       present           dirty  accessed                         
0xffb4b000-0xffb4bfff  0x3ce47000         4K        rw       present           dirty  accessed                         
0xffb4c000-0xffb4cfff  0x3ce6d000         4K        rw       present           dirty  accessed                         
0xffb4d000-0xffb4dfff  0x3cfe2000         4K        rw       present           dirty  accessed                         
0xffb4e000-0xffb4efff  0x3c86d000         4K        rw       present           dirty  accessed                         
0xffb4f000-0xffb4ffff  0x3c8bb000         4K        rw       present           dirty  accessed                         
0xffb50000-0xffb50fff  0x3c8eb000         4K        rw       present           dirty  accessed                         
0xffb51000-0xffb51fff  0x3c8b0000         4K        rw       present           dirty  accessed                         
---[ Highmem PTEs end ]---
---[ Fixmap start ]---
0xfffde000-0xfffdefff  0x3c8e6000         4K        rw       present           dirty  accessed                         
0xfffdf000-0xfffdffff  0x3c8f2000         4K        rw       present           dirty  accessed                         
---[ Fixmap end ]---


> /sys/kernel/debug/powerpc/block_address_translation

---[ Instruction Block Address Translation ]---
0: 0xc0000000-0xc07fffff 0x00000000 Kernel EXEC coherent 
1: 0xc0800000-0xc087ffff 0x00800000 Kernel EXEC coherent 
2:         -
3:         -
4:         -
5:         -
6:         -
7:         -

---[ Data Block Address Translation ]---
0: 0xc0000000-0xc07fffff 0x00000000 Kernel RO coherent 
1: 0xc0800000-0xc0bfffff 0x00800000 Kernel RO coherent 
2: 0xc0c00000-0xc0ffffff 0x00c00000 Kernel RW coherent 
3: 0xc1000000-0xc1ffffff 0x01000000 Kernel RW coherent 
4: 0xc2000000-0xc3ffffff 0x02000000 Kernel RW coherent 
5: 0xc4000000-0xc7ffffff 0x04000000 Kernel RW coherent 
6: 0xc8000000-0xcfffffff 0x08000000 Kernel RW coherent 
7: 0xd0000000-0xdfffffff 0x10000000 Kernel RW coherent 


> /sys/kernel/debug/powerpc/segment_registers

---[ User Segments ]---
0x00000000-0x0fffffff Kern key 1 User key 1 VSID 0x5d84d0
0x10000000-0x1fffffff Kern key 1 User key 1 VSID 0x5d85e1
0x20000000-0x2fffffff Kern key 1 User key 1 VSID 0x5d86f2
0x30000000-0x3fffffff Kern key 1 User key 1 VSID 0x5d8803
0x40000000-0x4fffffff Kern key 1 User key 1 VSID 0x5d8914
0x50000000-0x5fffffff Kern key 1 User key 1 VSID 0x5d8a25
0x60000000-0x6fffffff Kern key 1 User key 1 VSID 0x5d8b36
0x70000000-0x7fffffff Kern key 1 User key 1 VSID 0x5d8c47
0x80000000-0x8fffffff Kern key 1 User key 1 VSID 0x5d8d58
0x90000000-0x9fffffff Kern key 1 User key 1 VSID 0x5d8e69
0xa0000000-0xafffffff Kern key 1 User key 1 VSID 0x5d8f7a
0xb0000000-0xbfffffff Kern key 1 User key 1 VSID 0x5d908b

---[ Kernel Segments ]---
0xc0000000-0xcfffffff Kern key 0 User key 1 No Exec VSID 0x000ccc
0xd0000000-0xdfffffff Kern key 0 User key 1 No Exec VSID 0x000ddd
0xe0000000-0xefffffff Kern key 0 User key 1 No Exec VSID 0x000eee
0xf0000000-0xffffffff Kern key 0 User key 1 No Exec VSID 0x000fff


> first lines of dmesg

[    0.000000] Total memory = 1024MB; using 2048kB for hash table (at (ptrval))
[    0.000000] Linux version 5.1.0-rc7-dirty (ssb@spider) (gcc version 9.0.1 20190426 (prerelease) (GCC)) #1193 PREEMPT Mon Apr 29 10:59:53 MSK 2019
[    0.000000] Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0xd2
[    0.000000] Mapped at 0xff7c0000
[    0.000000] Found a Intrepid mac-io controller, rev: 0, mapped at 0x(ptrval)
[    0.000000] Processor NAP mode on idle enabled.
[    0.000000] PowerMac motherboard: PowerBook G4 15"
[    0.000000] Using PowerMac machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] -----------------------------------------------------
[    0.000000] Hash_size         = 0x200000
[    0.000000] phys_mem_size     = 0x40000000
[    0.000000] dcache_bsize      = 0x20
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x000000002510600a
[    0.000000]   possible        = 0x000000002f7ff14b
[    0.000000]   always          = 0x0000000000000000
[    0.000000] cpu_user_features = 0x9c000001 0x00000000
[    0.000000] mmu_features      = 0x00010001
[    0.000000] Hash              = 0x(ptrval)
[    0.000000] Hash_mask         = 0x7fff
[    0.000000] -----------------------------------------------------
[    0.000000] Found UniNorth PCI host bridge at 0x00000000f0000000. Firmware bus number: 0->1
[    0.000000] PCI host bridge /pci@f0000000  ranges:
[    0.000000]  MEM 0x00000000f1000000..0x00000000f1ffffff -> 0x00000000f1000000 
[    0.000000]   IO 0x00000000f0000000..0x00000000f07fffff -> 0x0000000000000000
[    0.000000]  MEM 0x00000000b0000000..0x00000000bfffffff -> 0x00000000b0000000 
[    0.000000] Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus number: 0->1
[    0.000000] PCI host bridge /pci@f2000000 (primary) ranges:
[    0.000000]  MEM 0x00000000f3000000..0x00000000f3ffffff -> 0x00000000f3000000 
[    0.000000]   IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
[    0.000000]  MEM 0x0000000080000000..0x00000000afffffff -> 0x0000000080000000 
[    0.000000] Found UniNorth PCI host bridge at 0x00000000f4000000. Firmware bus number: 0->1
[    0.000000] PCI host bridge /pci@f4000000  ranges:
[    0.000000]  MEM 0x00000000f5000000..0x00000000f5ffffff -> 0x00000000f5000000 
[    0.000000]   IO 0x00000000f4000000..0x00000000f47fffff -> 0x0000000000000000
[    0.000000] via-pmu: Server Mode is disabled
[    0.000000] PMU driver v2 initialized for Core99, firmware: 0c
[    0.000000] Top of RAM: 0x40000000, Total RAM: 0x40000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000]   HighMem  [mem 0x0000000030000000-0x000000003fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000003fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000003fffffff]
[    0.000000] On node 0 totalpages: 262144
[    0.000000]   Normal zone: 1536 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 196608 pages, LIFO batch:63
[    0.000000]   HighMem zone: 65536 pages, LIFO batch:15
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 260608
[    0.000000] Kernel command line: root=/dev/hda3 ro console=ttyUSB0,115200 console=tty0 consoleblank=120 
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Memory: 1023076K/1048576K available (8704K kernel code, 352K rwdata, 1344K rodata, 208K init, 1176K bss, 25500K reserved, 0K cma-reserved, 262144K highmem)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xfffcf000..0xfffff000  : fixmap
[    0.000000]   * 0xff800000..0xffc00000  : highmem PTEs
[    0.000000]   * 0xfde2b000..0xff800000  : early ioremap
[    0.000000]   * 0xf1000000..0xfde2b000  : vmalloc & ioremap
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
