Return-Path: <linuxppc-dev+bounces-12848-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A03EBD85B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 11:11:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm7kq6N79z30M0;
	Tue, 14 Oct 2025 20:11:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760433107;
	cv=none; b=PuertaijL8RDqvazYft4IA8V+pgxNV6j/Lq4T/vIChc764imsru+jvhbjydQrsVpVicv1TolLldsSSD4LigVlS0Fig5EGkNhLmksJjqMcbgovO3Nlm4iHs8+A5JQJo/I+wKZc7N9tb/WS5/0u0TPfDK8LXcSk3BduAxAh/7+25WFOYStuaLNoMufLe8//gZgLxi/kru2gwQnQKVHdJpxHXlO0squ+596l2fNivRTvnIDP81KTz8yCmKbS9WBaepnHRFTySkJlG6GJP0AK/LAH8TkGPxxOCvJg808WtbLo5jj2NmBoY09qnLq/HVcJCU4dAaVeyv43HJtbx3C7vdeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760433107; c=relaxed/relaxed;
	bh=DmZChAiP55LH7fuGlLhGHRkAsOIwC7Uf7Qc1D8RxjL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dVkRd65032TdQOD3JDN1BPGKc3PBJpD8tmFD4dERHUdVqT+e+RXL+H0KF9veGqar04qhy+AbzvuDbk9mEaVAbivUCNHNFHKIZ6InzxNR6yuiB+8vyLySt9/XWRwT8PB7377jf13QQmvVh9WFErshhIAPfp5Qk6fxaE48KDV9lX36/rAL1c9wYytn9d9s2yWckmK1FArT8Df3ZW0HSVwKU8l8VTSwUrikUzVIDmMpS19tHo/3BgBR9qEaHiFkVcZMW+FRhaydvWqP8XeL3yxj7BSij3skZz7chIoTvbnJ62Or93FvTr3u1ja+IOFIppgWOFGS/c8fo3UiQzc2gsC8DA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TQLaw0+6; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TQLaw0+6; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=juri.lelli@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TQLaw0+6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TQLaw0+6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=juri.lelli@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cm7kn4CXyz3020
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 20:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760433099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DmZChAiP55LH7fuGlLhGHRkAsOIwC7Uf7Qc1D8RxjL0=;
	b=TQLaw0+63TieRr6jGqbsuQB4mTLXlk4OZ+ZJXnNq2OkaKcngClMb4ezn3q9VCz+h/NVugK
	btSi4+SZwb14YZZ4XtBMC03XZIJ4eCnVOmy68efV97Szgd08dXse3E6HDMysPlGPMPW3Wg
	CgnfO9O8qRFY5fouOlHSuklMN4xCorg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760433099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DmZChAiP55LH7fuGlLhGHRkAsOIwC7Uf7Qc1D8RxjL0=;
	b=TQLaw0+63TieRr6jGqbsuQB4mTLXlk4OZ+ZJXnNq2OkaKcngClMb4ezn3q9VCz+h/NVugK
	btSi4+SZwb14YZZ4XtBMC03XZIJ4eCnVOmy68efV97Szgd08dXse3E6HDMysPlGPMPW3Wg
	CgnfO9O8qRFY5fouOlHSuklMN4xCorg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-1knP1wguMpefQkXO-WzCxg-1; Tue, 14 Oct 2025 05:11:35 -0400
X-MC-Unique: 1knP1wguMpefQkXO-WzCxg-1
X-Mimecast-MFC-AGG-ID: 1knP1wguMpefQkXO-WzCxg_1760433094
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46fa88b5760so16539565e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 02:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760433094; x=1761037894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmZChAiP55LH7fuGlLhGHRkAsOIwC7Uf7Qc1D8RxjL0=;
        b=TCJNncIO3pOglmHap3jKcqmrjumBlLNhALNYtrrdLgn9Y0QBrrb6xMRfw701eHjURk
         Xdef2EvYk16s9WD1wcje34Ok820uOExMsw6sWN1r400g6il5B8dBGrkMcyw9qyVnRLcd
         MS35Jn/sX8O9lW5GOGuaiiZAqYu3AZDRRwMq017Mi5FgOETpfLhrv4IgaLAJIjWjnp4c
         9Fhes7Kx80NxCeSdWBsHtafqBpKVmz6+pHbkEIYbVeT+QXb130H+cBuLL1dSzMOLBa3U
         K5XyvbCRmO82a9rUpumkWTW7qiRKIrrPVVI/Ydhn2tdiYvG0bySIr4k8ExttNdzfMBeG
         snaw==
X-Forwarded-Encrypted: i=1; AJvYcCW7EBPVwJGx8mjGcQo9YhhWZAf8VIu3p3VOto/hZABdIQ3QEHUEyHv9LjhSkzYkcvDNV6ADcM7dznH/smQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxOF2vphqtVBjyrgB6FoQZEHOmwQwR0px9he8ahHHzdtW2axEdC
	bRwabrDO4kUneXbadoSB0/ZjJwyjta+Y1CgLZrT3Gbm1cEu7kQ0zjXwzN3baQLfT1SfIa0Jq5z0
	njVpwXe5dGYg4EvNqd0u+r3yahVX7wZVeS+ZOoCJsBwSyeG5gmONPrU5bTL/VDtXl+AY=
X-Gm-Gg: ASbGncvC2WA1cJ5N0CZ/JjHaspoqHiEJGlHp0atzTR/IrbBRXsywmfFwxQvQJnQuZQH
	CWKBmlPU32MbxjUpx8rHoOrXu0DSd4VTQW1nu2c8RtR5RdtNyhgIyDWqrAM+Is2Z4LFUTdXW2kI
	RJZ25n2ZqJJ1Lm0BJYE8eJb7L1imQCqXtwdS+SsqrLSzwZi0jXPW28TYhXPI/Zcq7gmNRxHQfi0
	H/nY327X0CGKmTgv+Jfz168JYIPfC0x7uLQYM8bo9XGUnan6OFfsDofGOlDh7Pc9x9bVx5MUJvc
	oDPXRrHfGHjYAYnljVyucNp8DyHqHDx22lRZead2UAxbxP5sS44jIPWmBtgOiIWdpKs+WHIW
X-Received: by 2002:a05:600c:1986:b0:46e:4246:c90d with SMTP id 5b1f17b1804b1-46fa9aa4711mr148996095e9.11.1760433094378;
        Tue, 14 Oct 2025 02:11:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmrDXjCw08WD1TQhj3YC4hMNp555u6CSxx5SZw+8OCS1At5RI/2QEFWI5fYDiJWMd8bQmAcA==
X-Received: by 2002:a05:600c:1986:b0:46e:4246:c90d with SMTP id 5b1f17b1804b1-46fa9aa4711mr148995905e9.11.1760433094004;
        Tue, 14 Oct 2025 02:11:34 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.13.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab4e22d8sm145329615e9.5.2025.10.14.02.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 02:11:33 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:11:31 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	m.szyprowski@samsung.com, venkat88@linux.ibm.com,
	jstultz@google.com
Subject: Re: [PATCH] sched/deadline: stop dl_server before CPU goes offline
Message-ID: <aO4Tw1SzNpgWutK8@jlelli-thinkpadt14gen4.remote.csb>
References: <20251009184727.673081-1-sshegde@linux.ibm.com>
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
In-Reply-To: <20251009184727.673081-1-sshegde@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ghZVl7NzAm1WhadWuCOgQ5MAvnlHi_KBXnNKLq2vcqQ_1760433094
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

On 10/10/25 00:17, Shrikanth Hegde wrote:
> From: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> IBM CI tool reported kernel warning[1] when running a CPU removal
> operation through drmgr[2]. i.e "drmgr -c cpu -r -q 1"
> 
> WARNING: CPU: 0 PID: 0 at kernel/sched/cpudeadline.c:219 cpudl_set+0x58/0x170
> NIP [c0000000002b6ed8] cpudl_set+0x58/0x170
> LR [c0000000002b7cb8] dl_server_timer+0x168/0x2a0
> Call Trace:
> [c000000002c2f8c0] init_stack+0x78c0/0x8000 (unreliable)
> [c0000000002b7cb8] dl_server_timer+0x168/0x2a0
> [c00000000034df84] __hrtimer_run_queues+0x1a4/0x390
> [c00000000034f624] hrtimer_interrupt+0x124/0x300
> [c00000000002a230] timer_interrupt+0x140/0x320
> 
> Git bisects to: commit 4ae8d9aa9f9d ("sched/deadline: Fix dl_server getting stuck")
> 
> This happens since: 
> - dl_server hrtimer gets enqueued close to cpu offline, when 
>   kthread_park enqueues a fair task.
> - CPU goes offline and drmgr removes it from cpu_present_mask.
> - hrtimer fires and warning is hit.
> 
> Fix it by stopping the dl_server before CPU is marked dead.
> 
> [1]: https://lore.kernel.org/all/8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com/
> [2]: https://github.com/ibm-power-utilities/powerpc-utils/tree/next/src/drmgr
> 
> [sshegde: wrote the changelog and tested it]
> Fixes: 4ae8d9aa9f9d ("sched/deadline: Fix dl_server getting stuck")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>

Looks good to me.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks!
Juri


