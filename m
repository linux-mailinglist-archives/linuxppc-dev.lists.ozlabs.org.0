Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B392D9E9E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 19:12:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvqHK3fFfzDqDC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 05:12:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel@joelfernandes.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.a=rsa-sha256 header.s=google header.b=IrTGKI/n; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvqF00ld1zDqG1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 05:10:25 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id b64so12452296qkc.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 10:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=80A3v/WEjVbaiRbX2zqJ242KMRN7qmG3DpyY691VhNU=;
 b=IrTGKI/n7ayvbWMN0a7X/KHMS9wogZpz8jXczVP3WHMLZ2OioqQf8rwZllbIOzir+t
 sEehucHHdhqGg1HiD4LHnj3oQN1C+HBI6SoP8p8tqD+mZQ5fFFEKtrGaaBMzERcJdPvM
 9bIFtqhqJVo8i4kNOZFi0T7+9sY9Rwpb/0OIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=80A3v/WEjVbaiRbX2zqJ242KMRN7qmG3DpyY691VhNU=;
 b=Zvo5WkbFuW8NiklIgZHrcbrLnYmaGptBQYucd8rOVdjhUwmSUrZW+k8C0HdyhDbskt
 CmOsA82WUDQcdQ4sJwa1DkgJ0FpWQTbAO84gA2WjOmVB+p4b4p7gA2qegNYNEYiy/sdM
 z/rtpFP0mKbndfZd2gG1tL9ogKw5vwN8GledNWF6z5P+4p1WLqeFiHBVPCPEFduO4bRy
 1ibpCQDy5acpzTd0++z8FZK8RQ4srQy7tty+DesvLC1Ntd8rN3XrBvsWxh6QqG1DbZeM
 soIwg7em3wXo0DqqPuqb2iXpOym4tprLBHYzwjZDuB73QzKsbbGauFqrmcbVEjEMtnwg
 AHcg==
X-Gm-Message-State: AOAM532GqKODdzqdjx+J5pOBo+pSyqqDG0DnGQYgCV/xM6XF1EzkgoDP
 dQiUMj2MJ7e3VC8Qv++eVfwnzw==
X-Google-Smtp-Source: ABdhPJyfBtJ7ukfd4lWK/6JV64PA0nYgtm5rutT93yEigIeKNLOh4kyhUcVeIWDo3MK9DwEflPfRgw==
X-Received: by 2002:ae9:e10d:: with SMTP id g13mr33504576qkm.444.1607969422214; 
 Mon, 14 Dec 2020 10:10:22 -0800 (PST)
Received: from localhost ([2620:15c:6:411:cad3:ffff:feb3:bd59])
 by smtp.gmail.com with ESMTPSA id i13sm5321115qkk.83.2020.12.14.10.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:10:20 -0800 (PST)
Date: Mon, 14 Dec 2020 13:10:20 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v12 00/31] Speculative page faults
Message-ID: <X9eqjA8rNsQ91sg3@google.com>
References: <20190416134522.17540-1-ldufour@linux.ibm.com>
 <20190606065129.d5s3534p23twksgp@haiyan.sh.intel.com>
 <3d3cefa2-0ebb-e86d-b060-7ba67c48a59f@linux.ibm.com>
 <1c412ebe-c213-ee67-d261-c70ddcd34b79@linux.ibm.com>
 <20190620081945.hwj6ruqddefnxg6z@haiyan.sh.intel.com>
 <1594027500.30360.32.camel@mtkswgap22>
 <490c0811-50cd-0802-2cbc-9c031ef309f6@linux.ibm.com>
 <1594099897.30360.58.camel@mtkswgap22>
 <X9bIDHZbe4MB+BAg@google.com>
 <b256e5ed-0d4c-4baf-16a6-f32f122e344f@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b256e5ed-0d4c-4baf-16a6-f32f122e344f@linux.ibm.com>
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
 zhong jiang <zhongjiang@huawei.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>,
 David Rientjes <rientjes@google.com>, paulmck@linux.vnet.ibm.com,
 npiggin@gmail.com, sj38.park@gmail.com, Jerome Glisse <jglisse@redhat.com>,
 dave@stgolabs.net, kemi.wang@intel.com, kirill@shutemov.name,
 Thomas Gleixner <tglx@linutronix.de>, Haiyan Song <haiyanx.song@intel.com>,
 Ganesh Mahendran <opensource.ganesh@gmail.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, miles.chen@mediatek.com,
 vinayak menon <vinayakm.list@gmail.com>, akpm@linux-foundation.org,
 Tim Chen <tim.c.chen@linux.intel.com>, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 14, 2020 at 10:36:29AM +0100, Laurent Dufour wrote:
> Le 14/12/2020 à 03:03, Joel Fernandes a écrit :
> > On Tue, Jul 07, 2020 at 01:31:37PM +0800, Chinwen Chang wrote:
> > [..]
> > > > > Hi Laurent,
> > > > > 
> > > > > We merged SPF v11 and some patches from v12 into our platforms. After
> > > > > several experiments, we observed SPF has obvious improvements on the
> > > > > launch time of applications, especially for those high-TLP ones,
> > > > > 
> > > > > # launch time of applications(s):
> > > > > 
> > > > > package           version      w/ SPF      w/o SPF      improve(%)
> > > > > ------------------------------------------------------------------
> > > > > Baidu maps        10.13.3      0.887       0.98         9.49
> > > > > Taobao            8.4.0.35     1.227       1.293        5.10
> > > > > Meituan           9.12.401     1.107       1.543        28.26
> > > > > WeChat            7.0.3        2.353       2.68         12.20
> > > > > Honor of Kings    1.43.1.6     6.63        6.713        1.24
> > > > 
> > > > That's great news, thanks for reporting this!
> > > > 
> > > > > 
> > > > > By the way, we have verified our platforms with those patches and
> > > > > achieved the goal of mass production.
> > > > 
> > > > Another good news!
> > > > For my information, what is your targeted hardware?
> > > > 
> > > > Cheers,
> > > > Laurent.
> > > 
> > > Hi Laurent,
> > > 
> > > Our targeted hardware belongs to ARM64 multi-core series.
> > 
> > Hello!
> > 
> > I was trying to develop an intuition about why does SPF give improvement for
> > you on small CPU systems. This is just a high-level theory but:
> > 
> > 1. Assume the improvement is because of elimination of "blocking" on
> > mmap_sem.
> > Could it be that the mmap_sem is acquired in write-mode unnecessarily in some
> > places, thus causing blocking on mmap_sem in other paths? If so, is it
> > feasible to convert such usages to acquiring them in read-mode?
> 
> That's correct, and the goal of this series is to try not holding the
> mmap_sem in read mode during page fault processing.
> 
> Converting mmap_sem holder from write to read mode is not so easy and that
> work as already been done in some places. If you think there are areas where
> this could be done, you're welcome to send patches fixing that.
> 
> > 2. Assume the improvement is because of lesser read-side contention on
> > mmap_sem.
> > On small CPU systems, I would not expect reducing cache-line bouncing to give
> > such a dramatic improvement in performance as you are seeing.
> 
> I don't think cache line bouncing reduction is the main sourcec of
> performance improvement, I would rather think this is the lower part here.
> I guess this is mainly because during loading time a lot of page fault is
> occuring and thus SPF is reducing the contention on the mmap_sem.

Thanks for the reply. I think I also wrongly assumed that acquiring mmap
rwsem in write mode in a syscall makes SPF moot. Peter explained to me on IRC
that tere's still perf improvement in write mode if an unrelated VMA is
modified while another VMA is faulting.  CMIIW - not an mm expert by any
stretch.

Thanks!

 - Joel

