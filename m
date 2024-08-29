Return-Path: <linuxppc-dev+bounces-726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A942963CA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 09:22:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvXmS1mqVz2xQH;
	Thu, 29 Aug 2024 17:22:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ab"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724916152;
	cv=none; b=d2WCcQa5kYpoFSIOF6PqNtVKvmmod9gARVTe7FD4hHMsBU4gnkd94aDfha6ed0WNJMt9Av55bFDhDJuv7xV+Pgvem8tcuyDwsHvyr/vILQD+dMb9pHQpUxwhiX0hdtsoSTWnxU+v8m+HEuw4Wz0aRM/anu+avtQGGlU53+4xSpVJ3VW4Jtx8iSFVnE4Nw9ZR+WpKXOo3oi//VRuVNBp0wb1dP0cMH5UF9/9Qt4o6Z1ivfccRlli8COZ7SuZH6CjQltb+qNYOlsTI6GqM7IUL6p3mC6OiuzrSa7D/hFi3zp2T/9kqqE13H1+Ei1Q0Ndi8e7v4Ao6P9zznYKvgTwkjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724916152; c=relaxed/relaxed;
	bh=1zBRMlPjDgBVivgHAreopNXvVKzKab2jeoxF7VBexfY=;
	h=Message-ID:DKIM-Signature:Date:MIME-Version:Subject:To:Cc:
	 References:X-Report-Abuse:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Migadu-Flow; b=ajn2jusNJHtkTY0NhBT+WX6lD3SnzUGtHdU6jJ7KuKXokeiqT9ncGjbISInzRR9QPj6WjtUZgR9R+NSiZPcMRzc0pbU4yhc4WMCPk5IWAHsrPpb9zqjHXoldDc9Ns4DuqXPIGpuhMebNHIMFvZY7PghzrKTkxl4X5kowA8XrGESQlZHM31dynn/3Vm8a7yRIp++DndSTEAY2C2+2VnfTc+eh1IFwBHSv35l0+f/FY5rWVomtlDABhtnk2DOneN1oVxyzL4R2FiiZxmRqcqsVh+rz+5s5edGGfETpt1LLR8E3BD9nhAlr/J0rlZI3SgnP4G5qF8U4j/77nEpq1a51Lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D0c5SZwI; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::ab; helo=out-171.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D0c5SZwI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ab; helo=out-171.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [IPv6:2001:41d0:203:375::ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvXmQ1tK4z2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 17:22:27 +1000 (AEST)
Message-ID: <732c3fd3-3d04-456b-8fd7-a9fa438d21aa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724916123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zBRMlPjDgBVivgHAreopNXvVKzKab2jeoxF7VBexfY=;
	b=D0c5SZwIWdQNc7+YnMxsvzEUvr2k836FFmLmSHquTRnDq/LhuvvyZc2N3eHo18KznHIrk6
	Y/WrUpEdegapBasxAgsf8Oxt7mtbkrLdJy14FOhkfZQboK1oCQ0SnOHrvjt44okjcpK+Qv
	eiuEie5njUjVKm0tZOOO6qnmEuBt+pU=
Date: Thu, 29 Aug 2024 15:21:53 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 03/14] powerpc: assert_pte_locked() use
 pte_offset_map_ro_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, david@redhat.com,
 hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <89ae94f722996b4ee7ef20d44cd7f5e2f0495c47.1724310149.git.zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <89ae94f722996b4ee7ef20d44cd7f5e2f0495c47.1724310149.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2024/8/22 15:13, Qi Zheng wrote:
> In assert_pte_locked(), we just get the ptl and assert if it was already
> held, so convert it to using pte_offset_map_ro_nolock().
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

