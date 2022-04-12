Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7CD4FDC2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 13:01:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd2pG3qsrz3cG7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 21:01:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZoFzb3tl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629;
 helo=mail-ej1-x629.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZoFzb3tl; dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd2lm2T1Nz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 20:58:58 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id bg10so36566178ejb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 03:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+eJGktqK5V7HDq2U3VQXwapNjHNoENEgBXt1QNATELQ=;
 b=ZoFzb3tloXo+McRmkV6Gjg4GWW6lT27yGVpQhLtkyv6VtKJAkz3EOXC4aqUvcXQxTA
 fZk3vQyLWDrVKZghgFc8vooDWaYuBRlPXfhKU+uU/xhrw6hd7uU4BFjbWhlzkFjAmGPZ
 AIZAfM2nYSXw9Ziw9eywORZ+2hSZYIx9hW/8V3WAYu6elqDnzP3N5e2LzkpnKJ43TMAg
 iLr3BrXHMV+92mMcEL6FrJKEr+fP3v1xYy4dAD5BLkMFLvOjt24AkA2BpkvT1SFiy4I5
 OnZ9KtzFh9kv4tfn0kHZtUOosQl6A6yWQT8ZQdfvLARlvhWkUPNuOfcm+A8pYz1USsFA
 K9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+eJGktqK5V7HDq2U3VQXwapNjHNoENEgBXt1QNATELQ=;
 b=BIUPrRow6fURAvNYUfKkz5seGtpHhje/mqFJcl4lpFCx8GPaIICpFe2qM//87vdNaA
 XwXqZc0DpyOaFS/JxzXBxEMWCrorzvgv80xr++v3D2iFnJbHF6WHPdYstQMb2RguasKj
 ZpfZw2BLDdAH9yORbNmsgFGrpgC77TTcRsVfktnTXwO8Gzh0NTN97yIp3LJ1OYwC6pgF
 YR45He7qPRZCwF/DuzCNe0yPVLxOAB+BsmbJhjJ0Te9WCrL6QQgcTnLL1+zojNSWIWkW
 G91oYp+TzFuLUVphoTFdRPTclZ5uGnHvQ36NuQ9V6auIiO95oelWSGWGwOuwvt8T2mvM
 Dehg==
X-Gm-Message-State: AOAM531tyraNAnTc6QeUuocGJ19a+1PFjRprApCbouXCRluopQ/8J9qJ
 cbSydYkB3CKyya/+6ZfLmak=
X-Google-Smtp-Source: ABdhPJxep0FXI5E4VuHszT83H2dajpT8we3g05o3csYxYlKrvvyOU9hf7TeqHG/soEwhIlAY6GoNJQ==
X-Received: by 2002:a17:906:1603:b0:6ce:362:c938 with SMTP id
 m3-20020a170906160300b006ce0362c938mr34467412ejd.253.1649761131410; 
 Tue, 12 Apr 2022 03:58:51 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm16986370edz.35.2022.04.12.03.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:58:50 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v2 00/18] Remove use of list iterator after loop body
Date: Tue, 12 Apr 2022 12:58:12 +0200
Message-Id: <20220412105830.3495846-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When the list iterator loop does not exit early the list iterator variable
contains a type-confused pointer to a 'bogus' list element computed based
on the head [1].

Often a 'found' variable is used to ensure the list iterator
variable is only accessed after the loop body if the loop did exit early
(using a break or goto).

In other cases that list iterator variable is used in
combination to access the list member which reverses the invocation of
container_of() and brings back a "safe" pointer to the head of the list.

Since, due to this code patten, there were quite a few bugs discovered [2],
Linus concluded that the rule should be to never use the list iterator
after the loop and introduce a dedicated pointer for that [3].

With the new gnu11 standard, it will now be possible to limit the scope
of the list iterator variable to the traversal loop itself by defining
the variable within the for loop.
This, however, requires to remove all uses of the list iterator after
the loop.

Based on input from Paolo Abeni [4], Vinicius Costa Gomes [5], and
Jakub Kicinski [6], I've splitted all the net-next related changes into
two patch sets, where this is part 1.

v1->v2:
- Fixed commit message for PATCH 14/18 and used dedicated variable
  pointing to the position (Edward Cree)
- Removed redundant check in mv88e6xxx_port_vlan() (Vladimir Oltean)
- Refactor mv88e6xxx_port_vlan() using separate list iterator functions
  (Vladimir Oltean)
- Refactor sja1105_insert_gate_entry() to use separate list iterator
  functions (Vladimir Oltean)
- Allow early return in sja1105_insert_gate_entry() if
  sja1105_first_entry_longer_than() didn't find any element
  (Vladimir Oltean)
- Use list_add_tail() instead of list_add() in sja1105_insert_gate_entry()
  (Jakub Kicinski)
- net: netcp: also use separate 'pos' variable instead of duplicating list_add()

Link: https://lwn.net/Articles/887097/ [1]
Link: https://lore.kernel.org/linux-kernel/20220217184829.1991035-4-jakobkoschel@gmail.com/ [2]
Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [3]
Link: https://lore.kernel.org/linux-kernel/7393b673c626fd75f2b4f8509faa5459254fb87c.camel@redhat.com/ [4]
Link: https://lore.kernel.org/linux-kernel/877d8a3sww.fsf@intel.com/ [5]
Link: https://lore.kernel.org/linux-kernel/20220403205502.1b34415d@kernel.org/ [6]

Jakob Koschel (18):
  connector: Replace usage of found with dedicated list iterator
    variable
  net: dsa: sja1105: remove use of iterator after list_for_each_entry()
    loop
  net: dsa: sja1105: reorder sja1105_first_entry_longer_than with memory
    allocation
  net: dsa: sja1105: use list_add_tail(pos) instead of
    list_add(pos->prev)
  net: dsa: mv88e6xxx: remove redundant check in mv88e6xxx_port_vlan()
  net: dsa: mv88e6xxx: refactor mv88e6xxx_port_vlan()
  net: dsa: Replace usage of found with dedicated list iterator variable
  net: sparx5: Replace usage of found with dedicated list iterator
    variable
  qed: Use dedicated list iterator variable
  qed: Replace usage of found with dedicated list iterator variable
  qed: Remove usage of list iterator variable after the loop
  net: qede: Replace usage of found with dedicated list iterator
    variable
  net: qede: Remove check of list iterator against head past the loop
    body
  sfc: Remove usage of list iterator for list_add() after the loop body
  net: netcp: Remove usage of list iterator for list_add() after loop
    body
  ps3_gelic: Replace usage of found with dedicated list iterator
    variable
  ipvlan: Remove usage of list iterator variable for the loop body
  team: Remove use of list iterator variable for
    list_for_each_entry_from()

 drivers/connector/cn_queue.c                  | 13 ++---
 drivers/net/dsa/mv88e6xxx/chip.c              | 57 ++++++++++---------
 drivers/net/dsa/sja1105/sja1105_vl.c          | 51 +++++++++--------
 .../microchip/sparx5/sparx5_mactable.c        | 25 ++++----
 drivers/net/ethernet/qlogic/qed/qed_dev.c     | 11 ++--
 drivers/net/ethernet/qlogic/qed/qed_iwarp.c   | 26 ++++-----
 drivers/net/ethernet/qlogic/qed/qed_spq.c     |  6 +-
 .../net/ethernet/qlogic/qede/qede_filter.c    | 11 ++--
 drivers/net/ethernet/qlogic/qede/qede_rdma.c  | 11 ++--
 drivers/net/ethernet/sfc/rx_common.c          |  8 ++-
 drivers/net/ethernet/ti/netcp_core.c          | 14 +++--
 .../net/ethernet/toshiba/ps3_gelic_wireless.c | 30 +++++-----
 drivers/net/ipvlan/ipvlan_main.c              |  7 ++-
 drivers/net/team/team.c                       | 20 ++++---
 net/dsa/dsa.c                                 | 11 ++--
 15 files changed, 163 insertions(+), 138 deletions(-)


base-commit: 3e732ebf7316ac83e8562db7e64cc68aec390a18
--
2.25.1

