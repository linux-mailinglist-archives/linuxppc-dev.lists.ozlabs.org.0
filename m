Return-Path: <linuxppc-dev+bounces-2760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFF09B8DE5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2024 10:31:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xfwc36N1rz2yGM;
	Fri,  1 Nov 2024 20:31:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730453507;
	cv=none; b=WGVyaULDflPBwtm1xZ9u98asziyTEM2uLVKpoUDTMMQRys/frHHi6f/CJo1c8yLDXKTUaGncNrRzXJUw5VvBHvTI8m/0o5i+UQZKwBTk8YREkNjg4a8ZNzB/2pniDqXMNQm6aieEV8+dFMDkGIQqxHxKCWCQP40uCxh3NEnj/AqEv2nvnwMYndpu0iexA6HN/pR0TJZGY+1s7cLSDd3rVvL6fMNsY1YhJLw9kI2E5TlXNi6mJgajq8jlp8Rhsege5mNAiI2XX70nIvUAAMcvNNAeMvfP8ueQBxUoQ7x0IoLoxbQXTX6Zqpp5LOC6ZJnO4z3E8OQUGJDMdXJt8VfVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730453507; c=relaxed/relaxed;
	bh=bRtXYp9uSZhyFJ6aIO9ndrZ8PxfKsSbAu5n2VyXKSrA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VFY3NnPdac5rkX5lzCmYVRNZcedS7Pekgzra23A6SbCdveaUwQyUbNtBSXUL4Ce/VpGBuK8xsLui6x0P9mUSeQgUXGj0tmSXA8/+CxIVDOp2WbHOcIRropt9pLuvG4Ln+lKFX9doRg1NYQBNXMgfu+C3KfTn5D+oTGiQP/im5W5sM+ZQ+6rTfUB3doMI7tenxb+g/1TaLq0/UWsGPG7xDzcwHBSonTNB7ZwiS0omTvh04+iT54r32wyp0FXNpxl2oL2swgchzJqpbkAmsFSG+s8h4nhpQkWR6TxnSi0bB/vM/912gSnDyaC5xu/MS8//ERaEatnBjO8wi5gW6XZyeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sTh0cz9j; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8PKH97nE; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sTh0cz9j;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8PKH97nE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xfwc267CKz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 20:31:46 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730453498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bRtXYp9uSZhyFJ6aIO9ndrZ8PxfKsSbAu5n2VyXKSrA=;
	b=sTh0cz9jeEjl/nHRPDp3Zy7VsXBFyCthyomq9SR6Dzx2W6EgBML4YQlaeqZgLmPQiIIbsn
	JNroU4CRQVUCEitpVuFWa4MtnOyy5s+26iOJtCMfn3yawgWCIOFVJ6h0A/3Kfr4wo68LAb
	AghTIjIV/r/0WQfwMhtFHNSgjJ7iJvMlal8B80tQ4qMnRgn8DuEM/aIZORmwyxAwKh9LFM
	N8tsHk3R7eSWg8OsWMT+BACj99/tBemsSdWJdvKs/CGpidaFkUY6LZhFDTGnjjo2tFkraa
	TRsYu/K2GjVXy/7LinOfr5bH3qzv67Npjix2UyEo5buI+z5GotGdR5MkZsGwPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730453498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bRtXYp9uSZhyFJ6aIO9ndrZ8PxfKsSbAu5n2VyXKSrA=;
	b=8PKH97nEM3rOHURhaR6S+L7+WYJKlqoAcKnJbk65kf3FjXuNkqnFRRWnpIDWO60iGL1eT3
	mmO7IsCy+ZyufBBQ==
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, peterz@infradead.org,
 mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 pierre.gondois@arm.com, dietmar.eggemann@arm.com
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org,
 jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com
Subject: Re: [PATCH v7 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
In-Reply-To: <5617934d-45ac-509a-510e-d96d52a2ebf9@huawei.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-2-yangyicong@huawei.com> <87ttcty71m.ffs@tglx>
 <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com> <87frocwg64.ffs@tglx>
 <5617934d-45ac-509a-510e-d96d52a2ebf9@huawei.com>
Date: Fri, 01 Nov 2024 10:31:37 +0100
Message-ID: <87h68ruwp2.ffs@tglx>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 01 2024 at 11:18, Yicong Yang wrote:
> On 2024/10/31 21:33, Thomas Gleixner wrote:
>> cpu_smt_control is not guaranteed to have CPU_SMT_ENABLED state, so this
>> argument is bogus.
>> 
> sorry for didn't explain all the cases here.
>
> For cpu_sm_control == {CPU_SMT_ENABLED, CPU_SMT_NOT_SUPPORTED, CPU_SMT_NOT_IMPLEMENTED},
> all the cpu's bootable and we won't check topology_is_primary_thread().

You don't have to copy the code to me. I'm familiar with it.

All I need is a proper explanation why your topology_is_primary_thread()
implementation is correct under all circumstances.

Thanks,

        tglx

