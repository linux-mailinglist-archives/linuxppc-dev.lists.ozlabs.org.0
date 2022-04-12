Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C77D4FDF55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 14:18:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd4Wk48YPz2xXB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 22:18:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KMMgTD4e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KMMgTD4e; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd4TB5gt6z2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 22:16:29 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id k23so36917438ejd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 05:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SauRrPtkvH++wq5kM/ENmKVywKLBbnGlq4WrfqqSV+A=;
 b=KMMgTD4eqHSocfjUAX9sOYUKbAccfIdzUX7Y/cKXBZaA3DdYKoxaDEkMTRpY15o4Pp
 LEFDk2i7uYe0t8MnS99DWhcmH+n3krrsHjMfb/I9AeIsI7boJcVxlx6SSr3LxEFaO10s
 E+dBacnWczSHi6Vv6AnA0AFsgkjnfCuvnjTVH0BbxhhbuNqE4UFa+48BgViG/28eaG4b
 NZ2UlhPW2IbUHdjPVlGa6lA+1bTtbP/b9QYneqAekedYypLIIGTSjCsrCIUhJyEnNBmX
 FE6NJWukEY4Gyqss5WRrieAK/t7AiE0doun7ScIXJIEFBdGzgs0avwpahmiPVU8aR1Vm
 oAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SauRrPtkvH++wq5kM/ENmKVywKLBbnGlq4WrfqqSV+A=;
 b=Z+WeO5kUaFaxlC+x3RWcJ5YBwfg5BGh2NXR9nafd7a6SyPG7jqJAjqorHtKK3dAH/J
 NbhPNqFfG3gcO1S+fzmYutvkFaSeuKH644Wkdo5qKHarqbmky440mdOEqq6zmonSbW/M
 ZX5BVCbY8J7LdynGd7duQYi4A+mZWVwZWbR2F1xjWe9+t0+cjqSYnPwqbhB3iuUQlMLr
 4MPOxR0aKfUZsimSIXlkUKvNBqj0U6gvzKzNNPbmKYvqtPukpO31rHx/kWzY4BfNtbg1
 tSm/kbj0ntzDKygj6KKOZvX5PyPKcI5lxJk61cAe6z4VPT8Ba6Kh2UzWhH4LRANlGAIV
 +xDA==
X-Gm-Message-State: AOAM530KLDXpBtLb8BPNEpR+svKXWv0FpywSzLMqKB4QFXFLxfsf4uiG
 H8vym7fHD/n5IyBf0zbM28k=
X-Google-Smtp-Source: ABdhPJwaLV9WCXwPNDN9XsaLWYamOBWtMxnQwfCpN462OFM8kyd9vvvxbB2FB9m9bGxFmOH6VZCyVA==
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id
 x17-20020a170906299100b006cdac19ce34mr34558940eje.746.1649765780565; 
 Tue, 12 Apr 2022 05:16:20 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 b5-20020a17090630c500b006e8044fa76bsm8827900ejb.143.2022.04.12.05.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:16:20 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v3 00/18] Remove use of list iterator after loop body
Date: Tue, 12 Apr 2022 14:15:39 +0200
Message-Id: <20220412121557.3553555-1-jakobkoschel@gmail.com>
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
 "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
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

v2->v3:
- fix commit authors and signed-off order regarding Vladimir's patches
  (Sorry about that, wasn't intentional.)

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

