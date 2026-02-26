Return-Path: <linuxppc-dev+bounces-17313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFS/F42XoGnhkwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 19:57:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B297F1AE133
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 19:57:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMLL06cL8z2yrW;
	Fri, 27 Feb 2026 05:57:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772132232;
	cv=none; b=mFEE+ZOpU8uJFjSQ12RFb0a7x3rztRg18b7MEo1SvBIdX+sGjkIs1lnf26KLrxdsDWvnBDxDfYub+GoxpnzUvbQW+iwbIG9KONZ4cmmwRSkN1KRCv06ihyqvItM25KkTC9/XWbhRlFuoxu80pLU76p2pJMPj7Q3PyFnqn3VFafzpTyyzHFJATYVb3Jm0QPaXTwE7B7rLSlp5Xg9bq83q1VFqKWoRwR6dLDV42y+y1d1H87QFIXZM841kiz0TZh97tYj/qYDB312f3A++mXpegeEfLIwBl+43QmsWmxO3kDua0Wft6cKcIUn4cwBJjqmsiLv3HiCLc0bn/2xR37BXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772132232; c=relaxed/relaxed;
	bh=FIyJiF+EsFICIbGngtFt2QEoH02V0XdkHZzMYH6oSdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAkOdlbof4LYvQpQpBgeyx+72E/qxJM0lzQ/maFzA2TGegXsT3em27vllCC3cmnnBuGqDIz0iVy7rLf3cgGi01wczYQ5lxuFyaDqJA7KbgZ6ppo8AY7pxgB/+Mo97w6ygAY+w9+crFivcnaktwvwYfJaqgFxFvF4rd3EkwybziFohrxt4qdiZBWt3hwQuCM+xtU11Ze4k2D3XMxqqAp4Riw3UxojYqYvGHHNuC89eZBZz9f15s1pCi5Ie0DuIktTwLiwiipVxPtdbE9COl59ROBwqz/7exbwzzKU7p7jOtx0O8kZFgXo/ECKpjY4rrGKZikZeThkSQaqlvf6upTxUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AOuKzwpy; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AOuKzwpy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMLKz69NPz2yLH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 05:57:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DE356013A;
	Thu, 26 Feb 2026 18:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C14C116C6;
	Thu, 26 Feb 2026 18:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772132229;
	bh=PnxEIgfsXeStlrThxLfxoDBf2IdKb0WXD9cn82B/HT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AOuKzwpys4kof1ZxK7YXH2reFy+tcD+VOHwUOAvUXIQgyrggK4FbVj4kmokSrxxce
	 AiX9oVFnCv1wyqoUxClw/UI1VUJBGUzlCHWD1UR5W+AhVEQNKBmYnN8rA4QyWgB9fX
	 VcIo4zJSIlby/v3JSoy8oFh4cRBXgi3BuqwyWhUHIj3Jj15H7VtBW4VlT1EYhZmrbu
	 d3c/XrAwMiRW1EIvUvPM9JPfVR7XqnpV2Z/5zqaQqennlovKf4LiSeg8RN95a2nJ4G
	 GDHML72oPy9JtFFliUruxGMb2TUSCjf4yhRdXTCILJ8l0Wg+4lxR2y2FCwxv25fdn/
	 n36rzn+jSPB6w==
Message-ID: <df5dac1b-286d-43d5-a742-375b6de8730f@kernel.org>
Date: Thu, 26 Feb 2026 19:57:05 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] Bug: Write fault blocked by KUAP!
To: Caleb Sander Mateos <csander@purestorage.com>,
 Ming Lei <ming.lei@redhat.com>
Cc: Changhui Zhong <czhong@redhat.com>,
 Linux Block Devices <linux-block@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org
References: <CAGVVp+U0EYVX+VbbEHzcYP70zdmOXwAmUvpMYV9y3jBSRFmS6g@mail.gmail.com>
 <CAFj5m9L8ahNYFf-tUAZFKAUzkeyqV-Sx94MxC268XJ-hqHPCig@mail.gmail.com>
 <CAFj5m9+OCswLULgVx8eSydTG0OeN4f-8dK1-JyoAA70CNF88Qg@mail.gmail.com>
 <CADUfDZrq96YGiMN9==gMitAHZtXydOAwy-767-d0j5LdUqO91Q@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CADUfDZrq96YGiMN9==gMitAHZtXydOAwy-767-d0j5LdUqO91Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:csander@purestorage.com,m:ming.lei@redhat.com,m:czhong@redhat.com,m:linux-block@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17313-lists,linuxppc-dev=lfdr.de];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: B297F1AE133
X-Rspamd-Action: no action



Le 26/02/2026 à 17:59, Caleb Sander Mateos a écrit :
> On Thu, Feb 26, 2026 at 4:44 AM Ming Lei <ming.lei@redhat.com> wrote:
>>
>> On Thu, Feb 26, 2026 at 6:48 PM Ming Lei <ming.lei@redhat.com> wrote:
>>>
>>> Hi Changhui,
>>>
>>> Thanks for the report!
>>>
>>> Loop Caleb Sander Mateos  in.
>>>
>>> Thanks,
>>>
>>> On Thu, Feb 26, 2026 at 6:37 PM Changhui Zhong <czhong@redhat.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> on the ppc64le arch, I hit the issue below with ublksrv on the latest
>>>> linux-block/for-next, please help check it, and let me know if you
>>>> need any info/test for it. Thanks.
>>>>
>>>> INFO: HEAD of cloned kernel
>>>> commit 37a43fd770f3dcac8f72f3ea909b3e893e2385c9
>>>> Merge: 13cd9b41227a c1dfbd7e71b0
>>>> Author: Jens Axboe <axboe@kernel.dk>
>>>> Date:   Wed Feb 25 08:37:06 2026 -0700
>>>>
>>>>      Merge branch 'for-7.1/block' into for-next
>>>>
>>>>      * for-7.1/block:
>>>>        ublk: report BLK_SPLIT_INTERVAL_CAPABLE
>>>>
>>>> reproducer:
>>>> compile and install https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fublk-org%2Fublksrv.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cf0b0066758be476be95508de75587a73%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639077220067774377%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ki4yUMx%2FBTANcpfzEoVMdBKsuflIbzhHO2Wqpxtvj5g%3D&reserved=0
>>>> #echo 0 > /proc/sys/kernel/io_uring_disabled
>>>> #modprobe ublk_drv
>>>> #cd ublksrv
>>>> #make test T=null
>>>> #make test T=loop
>>>>
>>>> dmesg log：
>>>> Feb 26 00:24:30 ibm-p9z-27-lp26 journal: running null/002
>>>> Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: start ublksrv io
>>>> daemon ublksrvd-0
>>>> Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: tid 57923: ublk dev
>>>> 0 queue 0 started
>>>> Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: tid 57924: ublk dev
>>>> 0 queue 1 started
>>>> Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
>>>> [1772083476.4882] platform-linux: do-add-ip6-address[2:
>>>> fe80::8448:a3ff:fe51:f102]: failure 13 (Permission denied - ipv6: IPv6
>>>> is disabled on this device)
>>>> Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
>>>> [1772083476.4885] platform-linux: do-add-ip6-address[2:
>>>> 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
>>>> ipv6: IPv6 is disabled on this device)
>>>> Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
>>>> [1772083476.4938] l3cfg[0f1985ec14299e62,ifindex=2]: unable to
>>>> configure IPv6 route: type unicast fe80::/64 dev 2 metric 1024 mss 0
>>>> rt-src ipv6ll
>>>> Feb 26 00:24:38 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
>>>> [1772083478.4938] ipv6ll[95ab7f3fdbfe643d,ifindex=2]: changed: no IPv6
>>>> link local address to retry after Duplicate Address Detection failures
>>>> (back off)
>>>> Feb 26 00:24:38 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
>>>> [1772083478.4943] platform-linux: do-add-ip6-address[2:
>>>> 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
>>>> ipv6: IPv6 is disabled on this device)
>>>> Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
>>>> [1772083488.5034] platform-linux: do-add-ip6-address[2:
>>>> fe80::8448:a3ff:fe51:f102]: failure 13 (Permission denied - ipv6: IPv6
>>>> is disabled on this device)
>>>> Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
>>>> [1772083488.5037] platform-linux: do-add-ip6-address[2:
>>>> 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
>>>> ipv6: IPv6 is disabled on this device)
>>>> Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
>>>> [1772083488.5041] l3cfg[0f1985ec14299e62,ifindex=2]: unable to
>>>> configure IPv6 route: type unicast fe80::/64 dev 2 metric 1024 mss 0
>>>> rt-src ipv6ll
>>>> Feb 26 00:24:50 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
>>>> [1772083490.5034] ipv6ll[95ab7f3fdbfe643d,ifindex=2]: changed: no IPv6
>>>> link local address to retry after Duplicate Address Detection failures
>>>> (back off)
>>>> Feb 26 00:24:50 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
>>>> [1772083490.5039] platform-linux: do-add-ip6-address[2:
>>>> 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
>>>> ipv6: IPv6 is disabled on this device)
>>>> Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: Kernel attempted to read user
>>>> page (7fff81210000) - exploit attempt? (uid: 0)
>>>> Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: ------------[ cut here ]------------
>>>> Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: Bug: Read fault blocked by KUAP!
>>>> Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: WARNING:
>>>> arch/powerpc/mm/fault.c:231 at bad_kernel_fault.isra.0+0xc8/0x2c0,
>>>> CPU#5: lt-ublk.null/57924
>>
>> oops, it shouldn't be related with `ublk: report BLK_SPLIT_INTERVAL_CAPABLE`,
>> Perhaps one issue lies in the ppcle64 architecture code.
> 
> Agreed, the "Kernel attempted to read user page" error seems
> incorrect. The call trace shows this is in copy_from_iter(), so
> reading a user page is expected. I too would be suspicious of the
> powerpc copy_from_iter() implementation.

Looks similar to:

https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/

That fix was rejected, more acceptable fix here:

https://lore.kernel.org/all/20260217124457.89219-1-sayalip@linux.ibm.com/

Let us know if it fixes the issue for you.

Christophe

