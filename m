Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1236C2D91A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 03:05:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvPqr52xKzDqLq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 13:05:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel@joelfernandes.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.a=rsa-sha256 header.s=google header.b=jIFuMyW0; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvPny0PCmzDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 13:04:02 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id 7so10949441qtp.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 18:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3joCMQEgMYTRWtwvNU8XfkRxQvl1XcPWoJqmHhlAjNg=;
 b=jIFuMyW0CXPwPbzjytq1fyl28f5h7j18cK1dq9/kuoMitNcBn2VPPr+iiAdwiyshf8
 Sass69snymAmlv2w9RPxsB1q6+LKmXCPfpDzo0XV15UccAlREbVBq+V+jHCI6ci5QwI2
 xW3KXMx8jhphyq6rezDemv6LqKppWr9EI6OjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3joCMQEgMYTRWtwvNU8XfkRxQvl1XcPWoJqmHhlAjNg=;
 b=Si5xss+9e3i0J+PGZJrZ0dh8e7FaaNsNb+SW3Bt6YlN2zzNxMGjnBkTMKHdWZioCkL
 JtFKrH5JoIu4O4OabD+HJYBXbFyNM9liXdsyygwMVfRnVe9Sib5Vi2g5Kx+570N6tN18
 lhVvIcqP5feGabhIxSfQvZc4waqQtwBBnYS5M6qF/Jik+3Td+j2aX+yMbMGsC2LFL+y1
 grDzjnU0cvPGbFu1CcMzTGFa1pYR3Nsbkm6f+4vKgfuDsB1hZ3orW0y8jofi84U2hMBS
 y2g56qeHmhQnETlSwU87bE7muKDaqFPUGuukH/wooClUFrQ/13qTT1uqIjPQQ6YxPjzo
 I1jg==
X-Gm-Message-State: AOAM533baiRjBKv7BD9O1QYafnKTnPTcNFwtqHBsOt34G3LIn4QIQ1Qd
 Q03A3XoYvVAzbc++alWKNG4NbQ==
X-Google-Smtp-Source: ABdhPJyNrnChYZI79mij49ui4I23lfJGjf54I4Witq/Vsja69LURczot4O1GWdNPlqyHDHsWm5RREQ==
X-Received: by 2002:ac8:6758:: with SMTP id n24mr29731870qtp.258.1607911438765; 
 Sun, 13 Dec 2020 18:03:58 -0800 (PST)
Received: from localhost ([2620:15c:6:411:cad3:ffff:feb3:bd59])
 by smtp.gmail.com with ESMTPSA id g63sm13912475qkf.80.2020.12.13.18.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 18:03:57 -0800 (PST)
Date: Sun, 13 Dec 2020 21:03:56 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Chinwen Chang <chinwen.chang@mediatek.com>
Subject: Re: [PATCH v12 00/31] Speculative page faults
Message-ID: <X9bIDHZbe4MB+BAg@google.com>
References: <20190416134522.17540-1-ldufour@linux.ibm.com>
 <20190606065129.d5s3534p23twksgp@haiyan.sh.intel.com>
 <3d3cefa2-0ebb-e86d-b060-7ba67c48a59f@linux.ibm.com>
 <1c412ebe-c213-ee67-d261-c70ddcd34b79@linux.ibm.com>
 <20190620081945.hwj6ruqddefnxg6z@haiyan.sh.intel.com>
 <1594027500.30360.32.camel@mtkswgap22>
 <490c0811-50cd-0802-2cbc-9c031ef309f6@linux.ibm.com>
 <1594099897.30360.58.camel@mtkswgap22>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594099897.30360.58.camel@mtkswgap22>
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
Cc: jack@suse.cz, sergey.senozhatsky.work@gmail.com, peterz@infradead.org,
 Will Deacon <will.deacon@arm.com>, mhocko@kernel.org, linux-mm@kvack.org,
 paulus@samba.org, Punit Agrawal <punitagrawal@gmail.com>, hpa@zytor.com,
 Michel Lespinasse <walken@google.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andrea Arcangeli <aarcange@redhat.com>, ak@linux.intel.com,
 Minchan Kim <minchan@kernel.org>, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 zhong jiang <zhongjiang@huawei.com>, David Rientjes <rientjes@google.com>,
 paulmck@linux.vnet.ibm.com, npiggin@gmail.com, sj38.park@gmail.com,
 Jerome Glisse <jglisse@redhat.com>, dave@stgolabs.net, kemi.wang@intel.com,
 kirill@shutemov.name, Thomas Gleixner <tglx@linutronix.de>,
 Laurent Dufour <ldufour@linux.ibm.com>, Haiyan Song <haiyanx.song@intel.com>,
 Ganesh Mahendran <opensource.ganesh@gmail.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, miles.chen@mediatek.com,
 vinayak menon <vinayakm.list@gmail.com>, akpm@linux-foundation.org,
 Tim Chen <tim.c.chen@linux.intel.com>, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 07, 2020 at 01:31:37PM +0800, Chinwen Chang wrote:
[..]
> > > Hi Laurent,
> > > 
> > > We merged SPF v11 and some patches from v12 into our platforms. After
> > > several experiments, we observed SPF has obvious improvements on the
> > > launch time of applications, especially for those high-TLP ones,
> > > 
> > > # launch time of applications(s):
> > > 
> > > package           version      w/ SPF      w/o SPF      improve(%)
> > > ------------------------------------------------------------------
> > > Baidu maps        10.13.3      0.887       0.98         9.49
> > > Taobao            8.4.0.35     1.227       1.293        5.10
> > > Meituan           9.12.401     1.107       1.543        28.26
> > > WeChat            7.0.3        2.353       2.68         12.20
> > > Honor of Kings    1.43.1.6     6.63        6.713        1.24
> > 
> > That's great news, thanks for reporting this!
> > 
> > > 
> > > By the way, we have verified our platforms with those patches and
> > > achieved the goal of mass production.
> > 
> > Another good news!
> > For my information, what is your targeted hardware?
> > 
> > Cheers,
> > Laurent.
> 
> Hi Laurent,
> 
> Our targeted hardware belongs to ARM64 multi-core series.

Hello!

I was trying to develop an intuition about why does SPF give improvement for
you on small CPU systems. This is just a high-level theory but:

1. Assume the improvement is because of elimination of "blocking" on
mmap_sem.
Could it be that the mmap_sem is acquired in write-mode unnecessarily in some
places, thus causing blocking on mmap_sem in other paths? If so, is it
feasible to convert such usages to acquiring them in read-mode?

2. Assume the improvement is because of lesser read-side contention on
mmap_sem.
On small CPU systems, I would not expect reducing cache-line bouncing to give
such a dramatic improvement in performance as you are seeing.

Thanks for any insight on this!

- Joel

