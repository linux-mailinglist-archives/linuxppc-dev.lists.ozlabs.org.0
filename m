Return-Path: <linuxppc-dev+bounces-14537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEA4C91146
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 08:57:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHlxr3TJkz2yrg;
	Fri, 28 Nov 2025 18:57:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764316624;
	cv=none; b=KeY2B1CjMQiaJTiv3CIpMwI0dZhTajyR89u2Vf2nEQ49XLMNjhUB25Ah+PnE5deCUsCPjLyb4HBXDQsthb4jAt7CL5SxHMu4WhxYCZRQajweu/0yKvQisk+S5myltThq3UrxwNjq3TLvHYYyPP91nCORE570rdhMMIN6ORCFTactEx7t2G3qn4GLBpJd7V+t2q0OiTU+mPXuMowh71OPdiIT0HGYaCylRpGjvicokDZA0w2nrbQZJvD+GNgWyhH2//rMSQxAOD6ygUvLkJ+AXyElK2ZPVf2OleGGYVONopiOkaJewB5K+gico81ywZ4Ahpk5XPkk7P6JbZv5F10pVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764316624; c=relaxed/relaxed;
	bh=KO6CFhqSDZYbm0mOxnDmhYJI/5PlvV1unoGfvV0BWDI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=GZ2zJDfA8xyhtXiK1vUdMucPyDz0PvZ/AaB38pgxFOqDBBQNlhxHjohOuj4frDhJzpf7b2YeWpvROULXusJDPsgpqJLFOmlfi+kIulnheEfbwDs/NC9vjeBzqtcHlxsNoFyQ4Cu2nPZSWRP1jy4/8kvIQbbjwLxcBwfzcsNw8EsgPe/Dant9Q3R1cwz3Cg2dWm9SkvruSrmpmidvvl1ttupq14JMIohTcy2WHZ+4Fd39yPZIcnDChhYpb46Tqcff4ytfv01YMoYr1eJVM+vD8hdx7IZ3m2dJryuf2tlaC78ABPbCrXI1XMzhY+SxVmF9y0TdiJzXGS2JPHKQr2EAQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jqWTyePr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jqWTyePr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHlxq00KJz2yFs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 18:57:02 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so1807540b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 23:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764316620; x=1764921420; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KO6CFhqSDZYbm0mOxnDmhYJI/5PlvV1unoGfvV0BWDI=;
        b=jqWTyePrRcYoyF7eHKNdYFqXwhakx2EZuR46/iS9sox6jC3d4eHismZg/+sqFK118L
         8KR3wxj78h7xeZyvWZxTa1Bs1Ppii9z69KZ0oURkeelWQVzVauBfY5avNU13RAdFma5f
         sYUYNkBd0/hTn8sPI69Vq4OxhK8LuNeiBNkVhKRCCeJk4aOJnZ1/gbmADK6OQUALIF2J
         /w2TVYGEQZoO2DnE5z8ccxslHjxqRPwdp9v/Uz02PzFSFzVJ9djSEBdIPki1hVGE+O1e
         BlAgA3EPa7o2HACwBs+2x5LxQZ+o5r2borPYtxTnF5gBEPLAHKmyYiJcQ6rzNtYV5kfo
         Xg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764316620; x=1764921420;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KO6CFhqSDZYbm0mOxnDmhYJI/5PlvV1unoGfvV0BWDI=;
        b=OtGgFWvNpJ4+pZ4sEb/5nefOg2cY9a7hKVLVF6uF96lkebo8TZgO4A+4+LIFTztPgw
         sz9l2aoFRJgZV9H9XdlC0bAGVVeh8uuSHm6e4GPIV82bPHqUeDsSkI4OD+vt+je3m+fq
         qXP75yU4QBS2qfoXihcVvuglcPM9Dv8anSbE1mj5S8JE1FrAgNcAlcBjLkrPNqz5f8IN
         u3VE4YT3F6AQwKHQ/m3W/l0fZyPAW9DdF4/mKVq4wl8exOnTO9Mimh2M2V4aORS/8uS6
         D36d1pLcg28TUV9SmMcrz2qKZG1JXNfPAb39kP25Wslpfq7TDfPg5nekpeVC64KJU0Dz
         lOAg==
X-Forwarded-Encrypted: i=1; AJvYcCUGtKpVrF3NawZ2rn1eBIdETU2wJVtfn1lUNrVwmd03wVqLy4vGF+uiCHpk5czZ8X0JKw1RB4dyFAnwWTE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjO7XKM/t3dJWB0ZcG5wAQWYpa1bjY6TW3YawAE+E3HJKKHAUW
	dYo1QfbaJAuxLH6//3gcOtozbMj3GDkrukdt/AVwaAm4Vb41sgOmq/dD
X-Gm-Gg: ASbGncuREo4oW+TYxBNi5TflrNdAA3B7GjIMFaohNdcePW7rC84rAIGzay+zJvLoa4N
	HNLUYksn8XUDpGFO2KjCCZwS0g7K3yRvzYDlW4V0FxwemJ2/T2EUME/3u28p+CfnF9xKkJvFUlO
	YNUZs5lDm0v+ug8SvX1hq11l63hCTqWIVOqlknx/2+BIhTLDSoMG4qPPYq3AH7R8mWYilCVyyTq
	Xp0oO3h/HNrzOwQUKYRdaWjG+dJoDQsvoEBMTo4oEhpUoDgneiogzRHs0zvV656VNq9nmXw6q39
	6Nf92HXk+sEyOVKxRZI5pYusaFamLyzHMZmCNMUKv9T0xIcFceHN6v0NWIa8cX8Kjq2sQtRxtqS
	1DCNCHFFNhlJ+uC5+QpqIFwITWKRlrSBVHf/cZN+RT+h03ZKfO6JXwoNkEF6jw+e6vFrbbxMEHr
	/ABlJ0Vg==
X-Google-Smtp-Source: AGHT+IHuBDpZnopt8Cote8/VIf8qhi3UMfNXGn7GjA6YRt1a3Gw7FVTgXD7eArdg/MnJmDNzssBNYA==
X-Received: by 2002:a05:6a20:7f86:b0:35e:1a80:464 with SMTP id adf61e73a8af0-3614ed95c93mr29015651637.46.1764316620308;
        Thu, 27 Nov 2025 23:57:00 -0800 (PST)
Received: from dw-tp ([49.207.234.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151eb5bd9sm4110823b3a.27.2025.11.27.23.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 23:56:59 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 0/2] powerpc/pseries/cmm: two smaller fixes
In-Reply-To: <3cc7d401-c77c-4ac8-abb8-c264fbd9aaf0@kernel.org>
Date: Fri, 28 Nov 2025 13:19:08 +0530
Message-ID: <87y0nqmwaz.ritesh.list@gmail.com>
References: <20251021100606.148294-1-david@redhat.com> <557b5500-412a-4d26-8c4b-147c9a00d5fd@kernel.org> <87zf86n3vq.ritesh.list@gmail.com> <3cc7d401-c77c-4ac8-abb8-c264fbd9aaf0@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

"David Hildenbrand (Red Hat)" <david@kernel.org> writes:

> On 11/28/25 06:05, Ritesh Harjani (IBM) wrote:
>> "David Hildenbrand (Red Hat)" <david@kernel.org> writes:
>> 
>>> On 10/21/25 12:06, David Hildenbrand wrote:
>>>> Two smaller fixes identified while doing a bigger rework.
>>>>
>>>> Compile-tested only as I don't have an easy way to test right now.
>>>>
>>>> I would prefer for these patches to go through the MM tree as I will
>>>> be sending out a bigger version soon that is based on this series --
>>>> I split of the fixes from the other stuff.
>>>>
>>>
>>> Ping,
>>>
>>> I tried to get CMM running again (using the simulation mode I introduced
>>> a while back), but so far my attempts to get a reasonable powernv VM
>>> booted in QEMU failed :(
>>>
>>> (e.g., Fedora qcow2 images use xfs, but the open powernv loader is based
>>> on a 5.10 kernel without some mystical XFS feature ...)
>>>
>> 
>
> Hi Ritesh,
>
>> Sorry, I missed seeing this earlier.
>> 
>> Do you have the link to simulation mode which you are referring above
>> please? So far I didn't find the support of this beyond Linux LPAR
>> (pseries), but maybe I missed it.
>
> When I did a rework of the CMM balloon in 2019, I needed a way to test
> it. So I added
>
> commit b1713975c31ae20ecc40fd00191ee3fa51445d4a
> Author: David Hildenbrand <david@kernel.org>
> Date:   Thu Oct 31 15:29:31 2019 +0100
>
>      powerpc/pseries/cmm: Simulation mode

aah right. I should have looked closely. I was thinking you meant
somewhere in Qemu, so I was only looking there.

>      
>      Let's allow to test the implementation without needing HW support.
>      When "simulate=1" is specified when loading the module, we bypass all
>      HW checks and HW calls. The sysfs file "simulate_loan_target_kb" can
>      be used to simulate HW requests.
>      
>      The simualtion mode can be activated using:
>        modprobe cmm debug=1 simulate=1
>      
>      And the requested loan target can be changed using:
>        echo X > /sys/devices/system/cmm/cmm0/simulate_loan_target_kb
>
>
> I allows for bypassing the absence of FW_FEATURE_CMO.
>

Right. Let me give it a try first with pseries Qemu. Otherwise I have an
access to pseries LPAR too. I can verify it there. 

> Back in the days I was able to test it with a pseries (or was it powernv?)

Agree the name can be a bit confusing. So 
powernv == Power Non-Virtualized that's the baremetal Power box.
pseries == is basically the Linux LPAR on PowerVM. Qemu/KVM also has
support for booting Linux pseries guest.

> machine we had here at RH. So far my attempts failed to test it in a
> similar fashion in QEMU.
>

Let me give it a try and I will update how it goes.

Thanks!
-ritesh

