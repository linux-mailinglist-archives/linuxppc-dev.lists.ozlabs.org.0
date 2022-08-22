Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBCF59B824
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 05:54:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9z4g4CRCz3br0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 13:54:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yU0c+4dj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M9z3y1dYVz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 13:53:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=zTBrQi6tIHnpiZJcLtL9JGqfihQa+Uot5l+YHLsSKrU=; b=yU0c+4dj7PJ4pHovwDZMqOakG5
	kLJ+s38h9D7SfdV41AYLVig5CGyaTJp+yb1rT6ZQZX6pFLW3zQLvGLTNQwY9a3AwRpF6KZayqxf8+
	Itgy2L8nsAbjTkfodDLVLVo1MryD2liICOS8lB7x+TQ0gP4i03iCclgyR3nBQg/wWb80vI8TfMASi
	1oCfmk4ti2SqVOvE0qdrSPALegV6PXL9pF45lK4UyqZQ8AyH0xbDszy0qWubUx5/mLzpqijzzvmkR
	hzR093ck590rou/62nsxjfo8eWRG2AymqJ5FvKSaDEP6kNCDt4iWVY1MoNNKTh2kePf8A9uy9FuZV
	k6+ZlYWg==;
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPyV6-004Y5h-Pd; Mon, 22 Aug 2022 03:53:20 +0000
Message-ID: <f7214c7d-d573-ef4a-413d-28a63d293838@infradead.org>
Date: Sun, 21 Aug 2022 20:53:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] powerpc: export cpu_smallcore_map for modules
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20220819210112.7924-1-rdunlap@infradead.org>
 <87o7wdkkt4.fsf@mpe.ellerman.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87o7wdkkt4.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Nicholas Piggin <npiggin@gmail.com>, amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/21/22 20:40, Michael Ellerman wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
>> Fix build error when CONFIG_DRM_AMDGPU=m:
>>
>> ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>
>> by exporting 'cpu_smallcore_map' just as other per_cpu
>> symbols are exported.
>>
>> drivers/gpu/drm/amd/amdkfd/kfd_device.c calls cpu_smt_mask().
>> This is an inline function on powerpc which references
>> cpu_smallcore_map.
>>
>> Fixes: 425752c63b6f ("powerpc: Detect the presence of big-cores via "ibm, thread-groups"")
>> Fixes: 7bc913085765 ("drm/amdkfd: Try to schedule bottom half on same core")
> 
> That 2nd commit is not in mainline, only linux-next.
> 
> I don't mind merging this fix preemptively, but is that SHA stable?

Felix, Alex, can you answer that, please?

-- 
~Randy
