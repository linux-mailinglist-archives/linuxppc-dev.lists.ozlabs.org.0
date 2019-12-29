Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7333B12C06A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Dec 2019 05:35:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47lnmL5mZJzDqCl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Dec 2019 15:35:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="n7iOptnw"; 
 dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47lnkX5HsNzDqBv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2019 15:33:40 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e082c900000>; Sat, 28 Dec 2019 20:33:21 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sat, 28 Dec 2019 20:33:34 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sat, 28 Dec 2019 20:33:34 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 29 Dec
 2019 04:33:33 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
From: John Hubbard <jhubbard@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca> <20191220182939.GA10944@unreal>
 <1001a5fc-a71d-9c0f-1090-546c4913d8a2@nvidia.com>
 <20191222132357.GF13335@unreal>
 <49d57efe-85e1-6910-baf5-c18df1382206@nvidia.com>
 <20191225052612.GA212002@unreal>
 <b879d191-a07c-e808-e48f-2b9bd8ba4fa3@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <612aa292-ec45-295c-b56c-c622876620fa@nvidia.com>
Date: Sat, 28 Dec 2019 20:33:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <b879d191-a07c-e808-e48f-2b9bd8ba4fa3@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1577594001; bh=CS/Y1CGyDS+9QLfc4LRardH5VS56W/PAJOyfRY2LjTc=;
 h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=n7iOptnwN3ZVsCu/0DXie5ShRcR4/jOzIn6W7P3uTBxVaZt8ko4Dms+OE9l2tNSxe
 95GOtrfVtIDr0VsAlD/d/zPWSpFCkJY5UP5Eb2ss2F3NEgv4iTUN6NL2VHU+RtQqVi
 nFPi4CTJq0hll0B94/tPBP/T736se/ycwi7dWWtNiIfcgsX/aG2ZU9RUFFoSuSYe5B
 fwPDB3yWJZmxzNFs+zKaKVZ1e+/lnxSIdtwRl5XP/Vm1rz2l41lunDXgCSZTy/8O/h
 ByGzcgSVg+SF9TRzjsSZ/pWRsIBTO2VIGDe+IjvB1qU+Q0EIsH+JijQJxdtnLBWoeO
 bb0/oQMKrQ56Q==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Maor Gottlieb <maorg@mellanox.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Ran
 Rozenstein <ranro@mellanox.com>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/27/19 1:56 PM, John Hubbard wrote:
...
>> It is ancient verification test (~10y) which is not an easy task to
>> make it understandable and standalone :).
>>
>=20
> Is this the only test that fails, btw? No other test failures or hints of
> problems?
>=20
> (Also, maybe hopeless, but can *anyone* on the RDMA list provide some
> characterization of the test, such as how many pins per page, what page
> sizes are used? I'm still hoping to write a test to trigger something
> close to this...)
>=20
> I do have a couple more ideas for test runs:
>=20
> 1. Reduce GUP_PIN_COUNTING_BIAS to 1. That would turn the whole override =
of
> page->_refcount into a no-op, and so if all is well (it may not be!) with=
 the
> rest of the patch, then we'd expect this problem to not reappear.
>=20
> 2. Active /proc/vmstat *foll_pin* statistics unconditionally (just for th=
ese
> tests, of course), so we can see if there is a get/put mismatch. However,=
 that
> will change the timing, and so it must be attempted independently of (1),=
 in
> order to see if it ends up hiding the repro.
>=20
> I've updated this branch to implement (1), but not (2), hoping you can gi=
ve
> this one a spin?
>=20
> =C2=A0=C2=A0=C2=A0 git@github.com:johnhubbard/linux.git=C2=A0 pin_user_pa=
ges_tracking_v11_with_diags
>=20
>=20

Also, looking ahead:

a) if the problem disappears with the latest above test, then we likely hav=
e
   a huge page refcount overflow, and there are a couple of different ways =
to
   fix it.=20

b) if it still reproduces with the above, then it's some other random mista=
ke,
   and in that case I'd be inclined to do a sort of guided (or classic, ung=
uided)
   git bisect of the series. Because it could be any of several patches.

   If that's too much trouble, then I'd have to fall back to submitting a f=
ew
   patches at a time and working my way up to the tracking patch...


thanks,
--=20
John Hubbard
NVIDIA
