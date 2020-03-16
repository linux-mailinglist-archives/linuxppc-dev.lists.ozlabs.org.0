Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A0186630
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 09:17:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gq0D27LwzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 19:17:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=js1304@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B7QUWfZ2; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gpyb4bVqzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 19:15:33 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id p62so24613376qkb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 01:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F/i4UURiGEiDmJWiySfSNZr+o1KHFsCHgdng66n03Q0=;
 b=B7QUWfZ2p0iHwX6wNgX6U4yztQAMGDAiU1KFSHsaBYgSKDV+Kdl+8H155Lfmbg+9o/
 TxGbcBBwEqOPQ/B/w6jAG6N0rUQpjSNA+s/F/Tud+SRpVnYFph4gVet/kfh28qnd9zQt
 +zSo6COsT5fR35kjG2HJUXBsYVrX9cRZUknKCS7W5sr1GYRTBMEC1QpOzQ7viSl+n2pN
 cGaEg2tPimuaF7sbPikYKrNGerAbRU77SHD6nW+mqtjD7aZXVr2oYClwzswetpGkUdY6
 ldrXWz4oCSqcw2vqUL3VtrVAEe7+21fSUUt9pt7RqkY8U0lRZc6KjarLjC7fRfr6wPSh
 YpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F/i4UURiGEiDmJWiySfSNZr+o1KHFsCHgdng66n03Q0=;
 b=AvAnNUrcxK5uSQfVolZAWXfBDa68Cqg1SM4wshxkk0Te4NeBFITqm+id204isdhCNV
 gNO46ArWno5QaOHDbsnxEB/dM1ByLXPMS1HQKXNtHQ9mdpWQ8IjVKLgxXBmVBsXm5VbV
 po0ki1FKBdspCITCFd4UHd0XofqjBOt6XYdoVb0lYsWvsGfNqO0DcUv4doaGmhn8BI3y
 gM/nDCWdqBltjymwJKQs9iQI+70cWhKKNzwWwGdFyivdf6iZulJwXTqh3mK5xdDT/t/T
 Tz6zPl93TLlOyXKuIZE6QYTlBZtXElldG5RHw85R/ilQgdIYG20pSyRkQMLjc+tct+li
 Wpxg==
X-Gm-Message-State: ANhLgQ3q1XfjEF3MlI7T1IFdGF+P8t804XqH3g2/fWzM5wDnN2HWM6m4
 Q7xS7Gsj/nNaymCQp33z59+RJcGrc0Bd3uuLggQ=
X-Google-Smtp-Source: ADFU+vtuhvzirDhMCsmE4l39TWh2tgFAp6304DDB1OcJOZvmemJgfuS7i39szr9xiMsVL2Kk2XCoJDL/oQcWR3C4GH0=
X-Received: by 2002:a37:546:: with SMTP id 67mr24213408qkf.272.1584346530319; 
 Mon, 16 Mar 2020 01:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
 <20200311115735.GM23944@dhcp22.suse.cz>
 <20200312052707.GA3277@linux.vnet.ibm.com>
 <C5560C71-483A-41FB-BDE9-526F1E0CFA36@linux.vnet.ibm.com>
 <5e5c736a-a88c-7c76-fc3d-7bc765e8dcba@suse.cz>
 <20200312131438.GB3277@linux.vnet.ibm.com>
 <61437352-8b54-38fa-4471-044a65c9d05a@suse.cz>
 <20200312161310.GC3277@linux.vnet.ibm.com>
 <e115048c-be38-c298-b8d1-d4b513e7d2fb@suse.cz>
 <CAAmzW4OFy51BhAT62tdVQD52NNMWm+UPgoGAX97omY7P+nJ+5w@mail.gmail.com>
 <20200313110440.GA25144@linux.vnet.ibm.com>
 <06be5908-9af6-2892-0333-e9558b2cf474@suse.cz>
In-Reply-To: <06be5908-9af6-2892-0333-e9558b2cf474@suse.cz>
From: Joonsoo Kim <js1304@gmail.com>
Date: Mon, 16 Mar 2020 17:15:19 +0900
Message-ID: <CAAmzW4ME_WLYZPCt4+82RNKstv-H=LK5MKGGJR=6ha-ALS+FSw@mail.gmail.com>
Subject: Re: [PATCH 1/3] powerpc/numa: Set numa_node for all possible cpus
To: Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Mel Gorman <mgorman@suse.de>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

2020=EB=85=84 3=EC=9B=94 13=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 8:38, V=
lastimil Babka <vbabka@suse.cz>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 3/13/20 12:04 PM, Srikar Dronamraju wrote:
> >> I lost all the memory about it. :)
> >> Anyway, how about this?
> >>
> >> 1. make node_present_pages() safer
> >> static inline node_present_pages(nid)
> >> {
> >> if (!node_online(nid)) return 0;
> >> return (NODE_DATA(nid)->node_present_pages);
> >> }
> >>
> >
> > Yes this would help.
>
> Looks good, yeah.
>
> >> 2. make node_to_mem_node() safer for all cases
> >> In ppc arch's mem_topology_setup(void)
> >> for_each_present_cpu(cpu) {
> >>  numa_setup_cpu(cpu);
> >>  mem_node =3D node_to_mem_node(numa_mem_id());
> >>  if (!node_present_pages(mem_node)) {
> >>   _node_numa_mem_[numa_mem_id()] =3D first_online_node;
> >>  }
> >> }
> >>
> >
> > But here as discussed above, we miss the case of possible but not prese=
nt nodes.
> > For such nodes, the above change may not update, resulting in they stil=
l
> > having 0. And node 0 can be only possible but not present.

Oops, I don't read full thread so miss the case.

> So is there other way to do the setup so that node_to_mem_node() returns =
an
> online+present node when called for any possible node?

Two changes seems to be sufficient.

1. initialize all node's _node_numa_mem_[] =3D first_online_node in
mem_topology_setup()
2. replace the node with online+present node for _node_to_mem_node_[]
in set_cpu_numa_mem().

 static inline void set_cpu_numa_mem(int cpu, int node)
 {
        per_cpu(_numa_mem_, cpu) =3D node;
+       if (!node_present_pages(node))
+               node =3D first_online_node;
        _node_numa_mem_[cpu_to_node(cpu)] =3D node;
 }
 #endif

With these two change, we can safely call node_to_mem_node() anywhere.

Thanks.
