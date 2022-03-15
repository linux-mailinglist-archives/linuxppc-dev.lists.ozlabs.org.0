Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3B4DA4F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 22:59:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ6kq2d7Jz3bXd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 08:59:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ6kM5qQ0z2xTq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 08:59:04 +1100 (AEDT)
Received: from [192.168.0.3] (ip5f5ae8f9.dynamic.kabel-deutschland.de
 [95.90.232.249])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 416A561EA1928;
 Tue, 15 Mar 2022 22:58:58 +0100 (CET)
Message-ID: <0497a560-8c7b-7cf8-84ee-bde1470ae360@molgen.mpg.de>
Date: Tue, 15 Mar 2022 22:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Ariel Elior <aelior@marvell.com>, Sudarsana Kalluru
 <skalluru@marvell.com>, Manish Chopra <manishc@marvell.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: bnx2x: ppc64le: Unable to set message level greater than 0x7fff
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Linux folks,


On the POWER8 server IBM S822LC (ppc64le), I am unable to set the 
message level for the network device to 0x0100000 but it fails.

     $ sudo ethtool -s enP1p1s0f2 msglvl 0x0100000
     netlink error: cannot modify bits past kernel bitset size (offset 56)
     netlink error: Invalid argument

Below is more information. 0x7fff is the largest value I am able to set.

```
$ sudo ethtool -i enP1p1s0f2
driver: bnx2x
version: 5.17.0-rc7+
firmware-version: bc 7.10.4
expansion-rom-version:
bus-info: 0001:01:00.2
supports-statistics: yes
supports-test: yes
supports-eeprom-access: yes
supports-register-dump: yes
supports-priv-flags: yes
$ sudo ethtool -s enP1p1s0f2 msglvl 0x7fff
$ sudo ethtool enP1p1s0f2
Settings for enP1p1s0f2:
         Supported ports: [ TP ]
         Supported link modes:   10baseT/Half 10baseT/Full
                                 100baseT/Half 100baseT/Full
                                 1000baseT/Full
         Supported pause frame use: Symmetric Receive-only
         Supports auto-negotiation: Yes
         Supported FEC modes: Not reported
         Advertised link modes:  10baseT/Half 10baseT/Full
                                 100baseT/Half 100baseT/Full
                                 1000baseT/Full
         Advertised pause frame use: Symmetric Receive-only
         Advertised auto-negotiation: Yes
         Advertised FEC modes: Not reported
         Speed: Unknown!
         Duplex: Unknown! (255)
         Auto-negotiation: on
         Port: Twisted Pair
         PHYAD: 17
         Transceiver: internal
         MDI-X: Unknown
         Supports Wake-on: g
         Wake-on: d
         Current message level: 0x00007fff (32767)
                                drv probe link timer ifdown ifup rx_err 
tx_err tx_queued intr tx_done rx_status pktdata hw wol
         Link detected: no
$ sudo ethtool -s enP1p1s0f2 msglvl 0x8000
netlink error: cannot modify bits past kernel bitset size (offset 56)
netlink error: Invalid argument
```


Kind regards,

Paul


PS: This is unrelated to the other problem.
