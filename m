Return-Path: <linuxppc-dev+bounces-5915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E2A2B37E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 21:42:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypptc0nr7z301N;
	Fri,  7 Feb 2025 07:42:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.63.210.85
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738871849;
	cv=none; b=aETjP4zZn41UK1U2lMMiZvwX6LSQ92ZGXYQfpW3E96o5FpU52ZlkUd8LDcmUStX5MzyPKW4RKH95yv8599KEReSFtBt+TOTfbNe2ZOi6pp3UVa84BmcAcqJ/fWwZuoBD/iYj0AGvwzyd16iD4OakLy2He6DynVDQcgykUWaLZI+BXQQkObv7EX2AhcCqlbIxzBIpH/kdJnVW7nZn3LxpnK4RcygraAloXo8RjuWYsLNtTCJC8sDfyk34hhtJxRC5xkgcTPh9LJ2a7aTAs+zYIDcJoMYTSjzoNxwoD89sVzHKseBfE4qiR1SFMomaL1RFu3oQ56MezaJqq5gVF83M+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738871849; c=relaxed/relaxed;
	bh=Oq2MSbg8uowd0cp7hGubDTrXjjRg2sj0R+N70jk1ffs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QH+ZT91vK5/Of4d33nGsXaqyxE+MrGirRM0B6CXu0YYxkwz9UyWGrQmYwLWZ8MBPH7hKq/ZLNl1LIOi7CrHPSrCtRfI/wMOtzH3iBjnrqJTqY8mzZ+48nGLx/pWLm2OHJS+t941h6DzdXbtUXT7MmO2ih5VGmq36iuXp6MAvB5exaRa1sy/2v1XlwYL/xpSeL6KEZimERNvS0PUmOt5nEr44f+UpQwRvFyQ7SRpwUsRKznSeAnIuizws7bSTuHsqYwM8Y0nOXdxFvZsfQ9jqstbQWrRaGARf7j6qk7HzD72QuHaaL2OJInCDWCr0I7sOEtfy4zg+HledGlPvTkNnLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.a=rsa-sha256 header.s=default header.b=NCRCOX62; dkim-atps=neutral; spf=pass (client-ip=212.63.210.85; helo=mail.marcansoft.com; envelope-from=lina@asahilina.net; receiver=lists.ozlabs.org) smtp.mailfrom=asahilina.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.a=rsa-sha256 header.s=default header.b=NCRCOX62;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asahilina.net (client-ip=212.63.210.85; helo=mail.marcansoft.com; envelope-from=lina@asahilina.net; receiver=lists.ozlabs.org)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpnvC25zkz304f
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 06:57:25 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id BEC3E43A93;
	Thu,  6 Feb 2025 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738871838;
	bh=E+lU6r2Gicb6SJrSYXFHxoENYWrJPQXqghLrsfBIZ0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NCRCOX62cpd8AaeYgG4rxET2H1BdW5ASoApszzfwGbbwxcAi8JWEtWH7VKPS0yNrU
	 KFiGoOBJTGUiBY398SaWyKoOkkxLQKgcKB++A5vdRnKurYaFamwfuqDeD4Li0V7/BD
	 ZFbnXCZIVstHri09WyTDk3rsvei3iqp3Wv88gFpTjboT5hk1QReVygK8DNbS1rAE5e
	 ZVYOfzgP+exVnyyAMksacexFZh5ai5B5OIZuRLE+1hNKKzMmVYnbjvHmFUsKLTJapX
	 sqeFezTN1APVg2wUKlFuAfP0pLwgdEGNsgDxRLidt+apRNe3K3Tef2DzbQ48tGi6XJ
	 h0XYECuYgyX9w==
Message-ID: <2f4728be-3a0d-4bc3-ab11-6b1e2e3fbc6e@asahilina.net>
Date: Fri, 7 Feb 2025 04:57:13 +0900
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
To: Dan Williams <dan.j.williams@intel.com>, Vivek Goyal <vgoyal@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Sergio Lopez Pascual <slp@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 alison.schofield@intel.com, zhang.lyra@gmail.com,
 gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
 jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
 linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>,
 German Maglione <gmaglione@redhat.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com>
 <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
 <A1E3C5B2-CCD8-41BA-BBC8-E8338C18D485@asahilina.net>
 <67a5111b2f805_2d2c29448@dwillia2-xfh.jf.intel.com.notmuch>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <67a5111b2f805_2d2c29448@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/7/25 4:44 AM, Dan Williams wrote:
> Asahi Lina wrote:
>> Hi,
>>
>> On February 6, 2025 1:10:15 AM GMT+01:00, Dan Williams <dan.j.williams@intel.com> wrote:
>>> Vivek Goyal wrote:
>>>> On Fri, Jan 10, 2025 at 05:00:29PM +1100, Alistair Popple wrote:
>>>>> FS DAX requires file systems to call into the DAX layout prior to unlinking
>>>>> inodes to ensure there is no ongoing DMA or other remote access to the
>>>>> direct mapped page. The fuse file system implements
>>>>> fuse_dax_break_layouts() to do this which includes a comment indicating
>>>>> that passing dmap_end == 0 leads to unmapping of the whole file.
>>>>>
>>>>> However this is not true - passing dmap_end == 0 will not unmap anything
>>>>> before dmap_start, and further more dax_layout_busy_page_range() will not
>>>>> scan any of the range to see if there maybe ongoing DMA access to the
>>>>> range. Fix this by passing -1 for dmap_end to fuse_dax_break_layouts()
>>>>> which will invalidate the entire file range to
>>>>> dax_layout_busy_page_range().
>>>>
>>>> Hi Alistair,
>>>>
>>>> Thanks for fixing DAX related issues for virtiofs. I am wondering how are
>>>> you testing DAX with virtiofs. AFAIK, we don't have DAX support in Rust
>>>> virtiofsd. C version of virtiofsd used to have out of the tree patches
>>>> for DAX. But C version got deprecated long time ago.
>>>>
>>>> Do you have another implementation of virtiofsd somewhere else which
>>>> supports DAX and allows for testing DAX related changes?
>>>
>>> I have personally never seen a virtiofs-dax test. It sounds like you are
>>> saying we can deprecate that support if there are no longer any users.
>>> Or, do you expect that C-virtiofsd is alive in the ecosystem?
>>
>> I accidentally replied offlist, but I wanted to mention that libkrun
>> supports DAX and we use it in muvm. It's a critical part of x11bridge
>> functionality, since it uses DAX to share X11 shm fences between X11
>> clients in the VM and the XWayland server on the host, which only
>> works if the mmaps are coherent.
> 
> Ah, good to hear. It would be lovely to integrate an muvm smoketest
> somewhere in https://github.com/pmem/ndctl/tree/main/test so that we
> have early warning on potential breakage.

I think you'll probably want a smoke test using libkrun directly, since
muvm is quite application-specific. It's really easy to write a quick C
file to call into libkrun and spin up a VM.

If it's supposed to test an arbitrary kernel though, I'm not sure what
the test setup would look like. You'd need to run it on a host (whose
kernel is mostly irrelevant) and then use libkrun to spin up a VM with a
guest, which then runs the test. libkrun normally uses a bundled kernel
though (shipped as libkrunfw), we'd need to add an API to specify an
external kernel binary I guess?

I'm happy to help with that, but I'll need to know a bit more about the
intended usage first. I *think* most of the scaffolding for running
arbitrary kernels is already planned, since there was some talk of
running the host kernel as the guest kernel, so this wouldn't add much
work on top of that.

I definitely have a few tests in mind if we do put this together, since
I know of one or two things that are definitely broken in DAX upstream
right now (which I *think* this series fixes but I never got around to
testing it...).

Cc: slp for libkrun.

~~ Lina


