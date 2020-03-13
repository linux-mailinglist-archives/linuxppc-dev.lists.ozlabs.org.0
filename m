Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF0F184412
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 10:49:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48f1BT416gzDqLh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 20:49:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=js1304@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=idV80ylM; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48f18m4Q0czDqDt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 20:48:04 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id m33so6947999qtb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8ype9a2Pgy0TDkVr+jjtxMr6KTyOlymmisvMN8Riefk=;
 b=idV80ylMvEIMsvllcp2OWlep7Wg7lp0Ru/uKDyRC6qmc69JFzVeRgtSHUhR+D59WlM
 AoU7d3uKDNnIU1L8At21wB0rJIG17hd5BoXi5lLqgMBGnmwOMs8blHzdVC04jvi6xYui
 VIoMUsD22lhwAoWHU8w/iRpsazyrL77UIBOQZ7O0YewBF3lH5V3AYjrSvFPWYyu6I4Dz
 lmIpRCuLy0T/8xJY2bLzVqt7BVGuMqfPhBVGymY4PMzaxnf3FAOI9ltIzrUHPQFGt6xC
 foq4mOfumN0EfS2Z3VkXuD11EFgNuPjWhxsAjPbmAMIGuFGisI46U2A4qBu9rYkKJwnb
 bZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8ype9a2Pgy0TDkVr+jjtxMr6KTyOlymmisvMN8Riefk=;
 b=WZjDCIvegwY3xavQTOfB1pftjU3O89hPJzbguyXTKczS98D7z7yFHW8XGQdXwDnh7m
 1NhgPOZBSdhX4noKJwHi4ANScKU1mWZnQmRLifEBqeFWWzGoYzSF1r6ZQMOkq0ziRlWL
 zyozzJXkauyLN1b07arCItyKAARkWsp+rse8E8vWt7GOvCURxC3bI69+eZooflq/ywwj
 K4ZDUNfHn3vtrNGy5LBhVqC5dmlFPY1r96p2yDr1uVKMCIOeaEQeP3Nc4KqIXBYe2XVp
 o+ufnHNfvmVQfHa8vM3GlqDcoroLO9HBdahc9kUbVGm6ZgH4Xyf1IWpvIifIHa3kQHIN
 3z6A==
X-Gm-Message-State: ANhLgQ1m1X4f1oY9sqhTLCn5gNDijXevj6Ng5djUT4UDtf11Ko99ofpt
 H4FsFLbwH9v4bUlgm7NwNy4YH0FmRE2QZkMaPnk=
X-Google-Smtp-Source: ADFU+vtE7WMgh4Gv9w102cDFerGRE1K1vCLoXgu1/Vg4RBcxs88YSkurvuT2VTjzFld7v8QADYo+l0oWYGQvFcjPMK8=
X-Received: by 2002:aed:3346:: with SMTP id u64mr4634827qtd.333.1584092880504; 
 Fri, 13 Mar 2020 02:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200311110237.5731-1-srikar@linux.vnet.ibm.com>
 <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
 <20200311115735.GM23944@dhcp22.suse.cz>
 <20200312052707.GA3277@linux.vnet.ibm.com>
 <C5560C71-483A-41FB-BDE9-526F1E0CFA36@linux.vnet.ibm.com>
 <5e5c736a-a88c-7c76-fc3d-7bc765e8dcba@suse.cz>
 <20200312131438.GB3277@linux.vnet.ibm.com>
 <61437352-8b54-38fa-4471-044a65c9d05a@suse.cz>
 <20200312161310.GC3277@linux.vnet.ibm.com>
 <e115048c-be38-c298-b8d1-d4b513e7d2fb@suse.cz>
In-Reply-To: <e115048c-be38-c298-b8d1-d4b513e7d2fb@suse.cz>
From: Joonsoo Kim <js1304@gmail.com>
Date: Fri, 13 Mar 2020 18:47:49 +0900
Message-ID: <CAAmzW4OFy51BhAT62tdVQD52NNMWm+UPgoGAX97omY7P+nJ+5w@mail.gmail.com>
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

2020=EB=85=84 3=EC=9B=94 13=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 1:42, V=
lastimil Babka <vbabka@suse.cz>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 3/12/20 5:13 PM, Srikar Dronamraju wrote:
> > * Vlastimil Babka <vbabka@suse.cz> [2020-03-12 14:51:38]:
> >
> >> > * Vlastimil Babka <vbabka@suse.cz> [2020-03-12 10:30:50]:
> >> >
> >> >> On 3/12/20 9:23 AM, Sachin Sant wrote:
> >> >> >> On 12-Mar-2020, at 10:57 AM, Srikar Dronamraju <srikar@linux.vne=
t.ibm.com> wrote:
> >> >> >> * Michal Hocko <mhocko@kernel.org> [2020-03-11 12:57:35]:
> >> >> >>> On Wed 11-03-20 16:32:35, Srikar Dronamraju wrote:
> >> >> >>>> To ensure a cpuless, memoryless dummy node is not online, powe=
rpc need
> >> >> >>>> to make sure all possible but not present cpu_to_node are set =
to a
> >> >> >>>> proper node.
> >> >> >>>
> >> >> >>> Just curious, is this somehow related to
> >> >> >>> http://lkml.kernel.org/r/20200227182650.GG3771@dhcp22.suse.cz?
> >> >> >>>
> >> >> >>
> >> >> >> The issue I am trying to fix is a known issue in Powerpc since m=
any years.
> >> >> >> So this surely not a problem after a75056fc1e7c (mm/memcontrol.c=
: allocate
> >> >> >> shrinker_map on appropriate NUMA node").
> >> >> >>
> >> >
> >> > While I am not an expert in the slub area, I looked at the patch
> >> > a75056fc1e7c and had some thoughts on why this could be causing this=
 issue.
> >> >
> >> > On the system where the crash happens, the possible number of nodes =
is much
> >> > greater than the number of onlined nodes. The pdgat or the NODE_DATA=
 is only
> >> > available for onlined nodes.
> >> >
> >> > With a75056fc1e7c memcg_alloc_shrinker_maps, we end up calling kzall=
oc_node
> >> > for all possible nodes and in ___slab_alloc we end up looking at the
> >> > node_present_pages which is NODE_DATA(nid)->node_present_pages.
> >> > i.e for a node whose pdgat struct is not allocated, we are trying to
> >> > dereference.
> >>
> >> From what we saw, the pgdat does exist, the problem is that slab's per=
-node data
> >> doesn't exist for a node that doesn't have present pages, as it would =
be a waste
> >> of memory.
> >
> > Just to be clear
> > Before my 3 patches to fix dummy node:
> > srikar@ltc-zzci-2 /sys/devices/system/node $ cat $PWD/possible
> > 0-31
> > srikar@ltc-zzci-2 /sys/devices/system/node $ cat $PWD/online
> > 0-1
>
> OK
>
> >>
> >> Uh actually you are probably right, the NODE_DATA doesn't exist anymor=
e? In
> >> Sachin's first report [1] we have
> >>
> >> [    0.000000] numa:   NODE_DATA [mem 0x8bfedc900-0x8bfee3fff]
> >> [    0.000000] numa:     NODE_DATA(0) on node 1
> >> [    0.000000] numa:   NODE_DATA [mem 0x8bfed5200-0x8bfedc8ff]
> >>
> >
> > So even if pgdat would exist for nodes 0 and 1, there is no pgdat for t=
he
> > rest 30 nodes.
>
> I see. Perhaps node_present_pages(node) is not safe in SLUB then and it s=
hould
> check online first, as you suggested.
>
> >> But in this thread, with your patches Sachin reports:
> >
> > and with my patches
> > srikar@ltc-zzci-2 /sys/devices/system/node $ cat $PWD/possible
> > 0-31
> > srikar@ltc-zzci-2 /sys/devices/system/node $ cat $PWD/online
> > 1
> >
> >>
> >> [    0.000000] numa:   NODE_DATA [mem 0x8bfedc900-0x8bfee3fff]
> >>
> >
> > so we only see one pgdat.
> >
> >> So I assume it's just node 1. In that case, node_present_pages is real=
ly dangerous.
> >>
> >> [1]
> >> https://lore.kernel.org/linux-next/3381CD91-AB3D-4773-BA04-E7A072A6396=
8@linux.vnet.ibm.com/
> >>
> >> > Also for a memoryless/cpuless node or possible but not present nodes=
,
> >> > node_to_mem_node(node) will still end up as node (atleast on powerpc=
).
> >>
> >> I think that's the place where this would be best to fix.
> >>
> >
> > Maybe. I thought about it but the current set_numa_mem semantics are ap=
t
> > for memoryless cpu node and not for possible nodes.  We could have upto=
 256
> > possible nodes and only 2 nodes (1,2) with cpu and 1 node (1) with memo=
ry.
> > node_to_mem_node seems to return what is set in set_numa_mem().
> > set_numa_mem() seems to say set my numa_mem node for the current memory=
less
> > node to the param passed.
> >
> > But how do we set numa_mem for all the other 253 possible nodes, which
> > probably will have 0 as default?
> >
> > Should we introduce another API such that we could update for all possi=
ble
> > nodes?
>
> If we want to rely on node_to_mem_node() to give us something safe for ea=
ch
> possible node, then probably it would have to be like that, yeah.
>
> >> > I tried with this hunk below and it works.
> >> >
> >> > But I am not sure if we need to check at other places were
> >> > node_present_pages is being called.
> >>
> >> I think this seems to defeat the purpose of node_to_mem_node()? Should=
n't it
> >> return only nodes that are online with present memory?
> >> CCing Joonsoo who seems to have introduced this in ad2c8144418c ("topo=
logy: add
> >> support for node_to_mem_node() to determine the fallback node")
> >>
> >
> > Agree

I lost all the memory about it. :)
Anyway, how about this?

1. make node_present_pages() safer
static inline node_present_pages(nid)
{
if (!node_online(nid)) return 0;
return (NODE_DATA(nid)->node_present_pages);
}

2. make node_to_mem_node() safer for all cases
In ppc arch's mem_topology_setup(void)
for_each_present_cpu(cpu) {
 numa_setup_cpu(cpu);
 mem_node =3D node_to_mem_node(numa_mem_id());
 if (!node_present_pages(mem_node)) {
  _node_numa_mem_[numa_mem_id()] =3D first_online_node;
 }
}

With these two changes, we can uses node_present_pages() and node_to_mem_no=
de()
as intended.

Thanks.

> >> I think we do need well defined and documented rules around node_to_me=
m_node(),
> >> cpu_to_node(), existence of NODE_DATA, various node_states bitmaps etc=
 so
> >> everyone handles it the same, safe way.
>
> So let's try to brainstorm how this would look like? What I mean are some=
 rules
> like below, even if some details in my current understanding are most lik=
ely
> incorrect:
>
> with nid present in:
> N_POSSIBLE - pgdat might not exist, node_to_mem_node() must return some o=
nline
> node with memory so that we don't require everyone to search for it in sl=
ightly
> different ways
> N_ONLINE - pgdat must exist, there doesn't have to be present memory,
> node_to_mem_node() still has to return something else (?)
> N_NORMAL_MEMORY - there is present memory, node_to_mem_node() returns its=
elf
> N_HIGH_MEMORY - node has present high memory
