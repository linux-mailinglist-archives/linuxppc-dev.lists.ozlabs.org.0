Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B024F7CD3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:32:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyPv2wzGz3c8h
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:32:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KXwh36Ks;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KXwh36Ks; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyMw3XZXz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:06 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id bq8so9850998ejb.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bOp7/tC9bFhm53CLsSm24svzgwwfQBWtUDQnB+bIBuE=;
 b=KXwh36Kseg3CVGevbGAE8a3Ax24ainsjSrWTaHc30TLr2jSFkdYRDP0MaSryXI8M4v
 FBHfLFYpoaQGSX3GW2cn0FoJDmWZ1vY3c3fg+wtOnngvNO9fE1sDRwmM6BGgex1DwxnF
 r4oLScN+3qnwGdSh7+7vGPHJ1nZj0pdz8DUgZEw73PY1+09R25O6X9g0y/cs1VDWQ6pv
 zV/3gMcje94ykVaOdS1+CfDw6AGlQ9cM/Szvnq8SvH1mSJj6CZ77tt22yeMFUhscgNni
 QxdGGaxRWKPWZXYuyzF9XzYRAt78E0o4Df2jSqk1sXM15r8hDe8ygGJ3e6wiHffdLIaw
 Lrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bOp7/tC9bFhm53CLsSm24svzgwwfQBWtUDQnB+bIBuE=;
 b=J8nKhTpNIIKvd/2AgRS7I1AQ8xr9oj/HPKaZlphszo/TRvJfbsCoH8gt2bS95waejM
 9bTKWVQ0xyaR1/RA142tHa+3Ot69IUMOR49iTSLdg4ZnlDMz2kjWoXyhMY7FFy9oPmeD
 PooR9gF8E/B7vvLyt+PC5qd5pEcYCda6CgdCvf+j5dOuErtw10QQUXNUfbO+mizi+/G2
 TXNrrx3mpeNquDi6nS5sgrQTARY/On0l328X7SkxwSEd6qPfkmah2mQ+JNjGK5yZNwI1
 NmR70a1Z7dt47uPRu3kJrJunRcwPj7lK7D96mavBvnV69KGI/Dx5PzpObqHmEe0VMuMu
 cnCQ==
X-Gm-Message-State: AOAM532RQhRp8KtT7jFA+qtej4difvDy/fCc1x7//YGrhQ69U7vxTvQC
 lB2LFqx24WOLdMyLQATpHhU=
X-Google-Smtp-Source: ABdhPJwqHs9nH5lpOjXcb6/qKvV0pCQNXS3T+Kk1mOdvii1ND6yeM2aFqKeCAbxHGyh62D14O+e0lg==
X-Received: by 2002:a17:907:8a19:b0:6e8:a7e:5f50 with SMTP id
 sc25-20020a1709078a1900b006e80a7e5f50mr12871020ejc.322.1649327461054; 
 Thu, 07 Apr 2022 03:31:01 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:00 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 00/15] net: Remove use of list iterator after loop
 body
Date: Thu,  7 Apr 2022 12:28:45 +0200
Message-Id: <20220407102900.3086255-1-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 Ariel Elior <aelior@marvell.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Manish Chopra <manishc@marvell.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Vladimir Oltean <olteanv@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Casper Andersson <casper.casan@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
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

Link: https://lwn.net/Articles/887097/ [1]
Link: https://lore.kernel.org/linux-kernel/20220217184829.1991035-4-jakobkoschel@gmail.com/ [2]
Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [3]
Link: https://lore.kernel.org/linux-kernel/7393b673c626fd75f2b4f8509faa5459254fb87c.camel@redhat.com/ [4]
Link: https://lore.kernel.org/linux-kernel/877d8a3sww.fsf@intel.com/ [5]
Link: https://lore.kernel.org/linux-kernel/20220403205502.1b34415d@kernel.org/ [6]

