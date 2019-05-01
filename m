Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EECF10E9F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 23:39:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vWxR5w9YzDqFY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 07:39:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=brho@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KvFmuLge"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vShZ50PfzDqMX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 05:12:39 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id 85so8696943pgc.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 12:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AmRJhTtjfmKOoXa3/mXW1aySDkpXtExm2OlSrQR+ugY=;
 b=KvFmuLges6lzqL86Wp4gV1PjIrKF2kIQ/Yx5XZyG3wDE/yk+PZ0IVgcKRTiSxkGLmY
 1emllscLGeYik7SfWUbHKjEFkULGXLTyFTx9+jjwTcyIvZJasqta7kh2z2r7mjT4cSeQ
 4hpXBEfzBwkCxMI4TwM79Gtu32AExBI1rbCo+PlgaIzg6sFgQZ1vzOM2KigHWiYPUXkV
 QprpwrRd079y/Nxc/lpMMk7S3HRq7u7hQQfE0+wWT5en57lOtJB1ulKZXaSkWzxyQFsf
 hIRjjYWDacbrRvIdvx85yv5+PzzwpDEUVEAE3ELVQoXlTXAWk0klZ2IZZdCPBZD3/AhY
 hUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AmRJhTtjfmKOoXa3/mXW1aySDkpXtExm2OlSrQR+ugY=;
 b=ZfWNvrpefIFjwkQXXEUjxFIC+Id2g7TObWbRwBQNOkAhTCA9jtLocasdaP7CJRvnDd
 Vecaho7lLhG+ig5N8iM7RG5ZvN6EEyLoI4zn2bYi+PmOueWX9YIGgQ1tl/9TNd6/pWPd
 5EAfJhUZs9hPn8gS7ze2Uf6eAcgKXzd+wh820OUNMThjfCLMzw5uK758jE8VJUXXUU6G
 YWfNTNr5aTxaiW1WzTixIGmVde/G3zUDGXUGSirp5C08Hr45sDUakcVhcfc4JLkZ6gN/
 q7hrKZ8LQGfk1GKUWD7O1vZ8wCr+owhWc4Yk7GVCWlmotwk5k5OTpMRMYBYzl6VoXwvK
 DYOA==
X-Gm-Message-State: APjAAAXhyLhhB04FM66+vAIllAoK9j/pUTDq802MG3QRnlMO+LQPNFO/
 ru5OMi0NDvHdapSiaGsVDaDPnA==
X-Google-Smtp-Source: APXvYqy31d2sjh8GWh1zvaBPPWQhuKan83tMATfhwqSzWvN6oZmlGEUpR+06ZSdcPU34fmyVNmOyUg==
X-Received: by 2002:a63:66c1:: with SMTP id
 a184mr13541136pgc.412.1556737956127; 
 Wed, 01 May 2019 12:12:36 -0700 (PDT)
Received: from gnomeregan.cam.corp.google.com
 ([2620:15c:6:14:ad22:1cbb:d8fa:7d55])
 by smtp.googlemail.com with ESMTPSA id
 j12sm15835555pff.148.2019.05.01.12.12.33
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 12:12:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] x86, numa: always initialize all possible nodes
To: Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org
References: <20190212095343.23315-1-mhocko@kernel.org>
 <20190212095343.23315-2-mhocko@kernel.org>
From: Barret Rhoden <brho@google.com>
Message-ID: <34f96661-41c2-27cc-422d-5a7aab526f87@google.com>
Date: Wed, 1 May 2019 15:12:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190212095343.23315-2-mhocko@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 02 May 2019 07:37:43 +1000
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
Cc: Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Pingfan Liu <kernelfans@gmail.com>,
 Dave Hansen <dave.hansen@intel.com>, Michal Hocko <mhocko@suse.com>,
 Ingo Molnar <mingo@elte.hu>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi -

This patch triggered an oops for me (more below).

On 2/12/19 4:53 AM, Michal Hocko wrote:
[snip]
> Fix the issue by reworking how x86 initializes the memory less nodes.
> The current implementation is hacked into the workflow and it doesn't
> allow any flexibility. There is init_memory_less_node called for each
> offline node that has a CPU as already mentioned above. This will make
> sure that we will have a new online node without any memory. Much later
> on we build a zone list for this node and things seem to work, except
> they do not (e.g. due to nr_cpus). Not to mention that it doesn't really
> make much sense to consider an empty node as online because we just
> consider this node whenever we want to iterate nodes to use and empty
> node is obviously not the best candidate. This is all just too fragile.

The problem might be in here - I have a case with a 'memoryless' node 
that has CPUs that get onlined during SMP boot, but that onlining 
triggers a page fault during device registration.

I'm running on a NUMA machine but I marked all of the memory on node 1 
as type 12 (PRAM), using the memmap arg.  That makes node 1 appear to 
have no memory.

During SMP boot, the fault is in bus_add_device():

	error = sysfs_create_link(&bus->p->devices_kset->kobj,

bus->p is NULL.

That p is the subsys_private struct, and it should have been set in

	postcore_initcall(register_node_type);

But that happens after SMP boot.  This fault happens during SMP boot.

The old code had set this node online via alloc_node_data(), so when it 
came time to do_cpu_up() -> try_online_node(), the node was already up 
and nothing happened.

Now, it attempts to online the node, which registers the node with 
sysfs, but that can't happen before the 'node' subsystem is registered.

My modified e820 map looks like this:

> [    0.000000] user: [mem 0x0000000000000100-0x000000000009c7ff] usable
> [    0.000000] user: [mem 0x000000000009c800-0x000000000009ffff] reserved
> [    0.000000] user: [mem 0x00000000000e0000-0x00000000000fffff] reserved
> [    0.000000] user: [mem 0x0000000000100000-0x0000000073216fff] usable
> [    0.000000] user: [mem 0x0000000073217000-0x0000000075316fff] reserved
> [    0.000000] user: [mem 0x0000000075317000-0x00000000754f8fff] ACPI data
> [    0.000000] user: [mem 0x00000000754f9000-0x0000000076057fff] ACPI NVS
> [    0.000000] user: [mem 0x0000000076058000-0x0000000077ae9fff] reserved
> [    0.000000] user: [mem 0x0000000077aea000-0x0000000077ffffff] usable
> [    0.000000] user: [mem 0x0000000078000000-0x000000008fffffff] reserved
> [    0.000000] user: [mem 0x00000000fd000000-0x00000000fe7fffff] reserved
> [    0.000000] user: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
> [    0.000000] user: [mem 0x0000000100000000-0x00000004ffffffff] usable
> [    0.000000] user: [mem 0x0000000500000000-0x000000603fffffff] persistent (type 12)

Which leads to an empty zone 1:

> [    0.016060] Initmem setup node 0 [mem 0x0000000000001000-0x00000004ffffffff]
> [    0.073310] Initmem setup node 1 [mem 0x0000000000000000-0x0000000000000000]

The backtrace:

> [    2.175327] Call Trace:
> [    2.175327]  device_add+0x43e/0x690
> [    2.175327]  device_register+0x107/0x110
> [    2.175327]  __register_one_node+0x72/0x150
> [    2.175327]  __try_online_node+0x8f/0xd0
> [    2.175327]  try_online_node+0x2b/0x50
> [    2.175327]  do_cpu_up+0x46/0xf0
> [    2.175327]  cpu_up+0x13/0x20
> [    2.175327]  smp_init+0x6e/0xd0
> [    2.175327]  kernel_init_freeable+0xe5/0x21f
> [    2.175327]  ? rest_init+0xb0/0xb0
> [    2.175327]  kernel_init+0xf/0x180
> [    2.175327]  ? rest_init+0xb0/0xb0
> [    2.175327]  ret_from_fork+0x1f/0x30

To get it booting again, I unconditionally node_set_online:

arch/x86/mm/numa.c
@@ -583,7 +583,7 @@ static int __init numa_register_memblks(struct 
numa_meminfo *mi)
                         continue;

                 alloc_node_data(nid);
-               if (end)
+               //if (end)
                         node_set_online(nid);
         }

A more elegant solution may be to avoid registering with sysfs during 
early boot, or something else entirely.  But I figured I'd ask for help 
at this point.  =)

Thanks,

Barret

