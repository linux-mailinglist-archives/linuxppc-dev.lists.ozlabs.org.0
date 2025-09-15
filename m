Return-Path: <linuxppc-dev+bounces-12215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0FB57716
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 12:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQMJF3bQyz3cyb;
	Mon, 15 Sep 2025 20:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757933437;
	cv=none; b=VPlv7CnZFBarAArB1wP0dcGTweSHQ8Kh2JuJIIJszyhpoNnYn/mtOzj5nXylOkPraG+9iQQgAWAriyyT4g09M7d0w3putDU+tC8Wg+gPZ+F/VT2SVnezbxYZ3USyUu1+3gpUfUWrUQ+AipXlQNoCF8UOrdXtAJptMeFH0EIOwskTxp/6F70FAkftr7Zf+6jdwpygLpvl7mYJSXPxxEcbyv9H19aiP6xCakc0mDgrxour9ftz+XeSX97CnkXdzSZnHnTfQd+emdwRtoIxHeHsKFeiYbvu1HCAFs22uw8oVADZthIAI+nDZ7CfDKw2/pJAe/oMXckC1lU+fu5skwSMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757933437; c=relaxed/relaxed;
	bh=VtI765DIx2xQZZo7VQVH2HkrLTihkYGKkElurlUhLAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ow2NPYh05GpnG1VQf0gSJH/A5LWdbt2oJXoCZKgLgTow0WLvmWSGGFELzMQYonlE/tGwT8o1jfOaoToh2W+8ukVEah1jx+DQf8ekJSJTL6K+MxOcMppvuhZfjImQhrj1hGhFOwE8lg8yb9RNxTJJEN36pw5To1Wc1BrP+C96/K0xgMm9grK/uMWPSSNrdxKmsMxoVhswByiXkxt4dpYuqUtSKpUuT3YIgaU+7V9hQTRA4zm3R8DX4scXuPQ2T/+3mT6trD3oHOU5fLJarPH3FhgRCC3Qz8NIwHKpzx8/gY6xKB3/A95RDsDM283hQYQGbvzu+TcdBld/xvQsXeiLVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQMJD5VWvz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 20:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQM2p1Pc9z9sxY;
	Mon, 15 Sep 2025 12:38:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GczDd0MPrivs; Mon, 15 Sep 2025 12:38:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQM2p004Pz9sxX;
	Mon, 15 Sep 2025 12:38:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DC98C8B765;
	Mon, 15 Sep 2025 12:38:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id L12I9pCXFpTn; Mon, 15 Sep 2025 12:38:57 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A34148B763;
	Mon, 15 Sep 2025 12:38:57 +0200 (CEST)
Message-ID: <bc6c17d2-298b-4629-9de1-dcecc3aac58f@csgroup.eu>
Date: Mon, 15 Sep 2025 12:38:57 +0200
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
Subject: Re: [PATCH V3 0/7] Add interface to expose vpa dtl counters via
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
 irogers@google.com, namhyung@kernel.org, linux-perf-users@vger.kernel.org,
 aboorvad@linux.ibm.com, sshegde@linux.ibm.com, hbathini@linux.vnet.ibm.com,
 Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250915102947.26681-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 15/09/2025 à 12:29, Athira Rajeev a écrit :
> The pseries Shared Processor Logical Partition(SPLPAR) machines can
> retrieve a log of dispatch and preempt events from the hypervisor
> using data from Disptach Trace Log(DTL) buffer. With this information,
> user can retrieve when and why each dispatch & preempt has occurred.
> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
> via perf.
> 
> - Patches 1 to 6 has powerpc PMU driver code changes to capture DTL
>    trace in perf.data. And patch 7 has documentation update.
> 
> Infrastructure used
> ===================
> 
> The VPA DTL PMU counters do not interrupt on overflow or generate any
> PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The timer
> nterval can be provided by user via sample_period field in nano seconds.
> vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. DTL (Dispatch
> Trace Log) contains information about dispatch/preempt, enqueue time etc.
> We directly copy the DTL buffer data as part of auxiliary buffer and it
> will be processed later. This will avoid time taken to create samples
> in the kernel space. The PMU driver collecting Dispatch Trace Log (DTL)
> entries makes use of AUX support in perf infrastructure. On the tools side,
> this data is made available as PERF_RECORD_AUXTRACE records.
> 
> To corelate each DTL entry with other events across CPU's, an auxtrace_queue
> is created for each CPU. Each auxtrace queue has a array/list of auxtrace buffers.
> All auxtrace queues is maintained in auxtrace heap. The queues are sorted
> based on timestamp. When the different PERF_RECORD_XX records are processed,
> compare the timestamp of perf record with timestamp of top element in the
> auxtrace heap so that DTL events can be co-related with other events
> Process the auxtrace queue if the timestamp of element from heap is
> lower than timestamp from entry in perf record. Sometimes it could happen that
> one buffer is only partially processed. if the timestamp of occurrence of
> another event is more than currently processed element in the queue, it will
> move on to next perf record. So keep track of position of buffer to continue
> processing next time. Update the timestamp of the auxtrace heap with the timestamp
> of last processed entry from the auxtrace buffer.
> 
> This infrastructure ensures dispatch trace log entries can be corelated
> and presented along with other events like sched.
> 
> With the kernel changes;
> 
>    # ls /sys/devices/vpa_dtl/
>    events  format  perf_event_mux_interval_ms  power  subsystem  type  uevent
> 
> Thanks
> Athira

What is the difference between this version of the series and the V2 
sent 3 hours ago ?

Christophe


