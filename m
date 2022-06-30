Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D056209A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 18:53:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYktm17z6z3ds6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 02:53:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=L9ITzqRq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.co.jp (client-ip=72.21.196.25; helo=smtp-fw-2101.amazon.com; envelope-from=prvs=1735bfab6=kuniyu@amazon.co.jp; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=L9ITzqRq;
	dkim-atps=neutral
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYkt42TFbz3cFp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 02:53:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1656607997; x=1688143997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KsElMMV1bJlVwGHQ/Mjz0xvQEu4xL3MMNuHw+BIVMuM=;
  b=L9ITzqRq1lD2VwkPESr+10lURM4su1wps/FvchbjHsV9MuUIN8CHrE77
   Qqdjv/YwmE1n63f5kbyJA9sF46F0e6AEbHqGrTnVV38hyGVjephAgzv8+
   irbwy0wysB9UgryTzrlGsVyjmqxK7mdU6A0W+BmDlYDvrNJO1bcOPCENX
   s=;
X-IronPort-AV: E=Sophos;i="5.92,234,1650931200"; 
   d="scan'208";a="213555444"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-iad-1e-26daedd8.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 30 Jun 2022 16:52:01 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1e-26daedd8.us-east-1.amazon.com (Postfix) with ESMTPS id 2E34981585;
	Thu, 30 Jun 2022 16:51:59 +0000 (UTC)
Received: from EX13D04ANC001.ant.amazon.com (10.43.157.89) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Thu, 30 Jun 2022 16:51:59 +0000
Received: from 88665a182662.ant.amazon.com (10.43.160.124) by
 EX13D04ANC001.ant.amazon.com (10.43.157.89) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Thu, 30 Jun 2022 16:51:57 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <sachinp@linux.ibm.com>
Subject: Re: [powerpc] Fingerprint systemd service fails to start (next-20220624)
Date: Thu, 30 Jun 2022 09:51:49 -0700
Message-ID: <20220630165149.55265-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <DC7D445E-8A04-4104-AF90-6A530CB5FF93@linux.ibm.com>
References: <DC7D445E-8A04-4104-AF90-6A530CB5FF93@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.124]
X-ClientProxiedBy: EX13D28UWC001.ant.amazon.com (10.43.162.166) To
 EX13D04ANC001.ant.amazon.com (10.43.157.89)
Precedence: Bulk
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-next@vger.kernel.org, kuniyu@amazon.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From:   Sachin Sant <sachinp@linux.ibm.com>
Date:   Thu, 30 Jun 2022 16:07:06 +0530
>>> Yes, the problem can be recreated after login. I have collected the strace
>>> logs.
>> 
>> I confirmed fprintd failed to launch with this message on failure case.
>> 
>> ===
>> ltcden8-lp6 fprintd[2516]: (fprintd:2516): fprintd-WARNING **: 01:56:45.705: Failed to open connection to bus: Could not connect: Connection refused
>> ===
>> 
>> 
>> But in the strace log of both cases, only one socket is created and
>> following connect() completes without an error.  And the peer socket
>> does not seem to be d-bus one.
>> 
>> ===
>> $ cat working-case/strace-fprintd-service.log | grep "socket("
>> 01:52:08 socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
>> $ cat working-case/strace-fprintd-service.log | grep "socket(" -A 10
>> 01:52:08 socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
>> ...
>> 01:52:08 connect(3, {sa_family=AF_UNIX, sun_path="/run/systemd/private"}, 22) = 0
>> ...
>> $ cat not-working-case/strace-fprintd-service.log | grep "socket("
>> 01:58:14 socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
>> $ cat not-working-case/strace-fprintd-service.log | grep "socket(" -A 10
>> 01:58:14 socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
>> ...
>> 01:58:14 connect(3, {sa_family=AF_UNIX, sun_path="/run/systemd/private"}, 22) = 0
>> ===
>> 
>> So I think the error message part is not traced well.
>> Could you try to strace directly for the command in ExecStart section of
>> its unit file?
>> 
> 
> Thank you for your inputs. This is what I did, changed the ExecStart
> line in /usr/lib/systemd/system/fprintd.service to
> 
> ExecStart=strace -t -ff /usr/libexec/fprintd
> 
> Captured the logs after recreating the problem.
> fprintd-pass-strace.log (working case) and
> fprintd-strace-fail.log (failing case).
> 
> In case of failure I see following:
> 
> Jun 30 05:52:41 ltcden8-lp6 strace[5595]: [pid  5599] 05:52:41 connect(5, {sa_family=AF_UNIX, sun_path="/var/run/dbus/system_bus_socket"}, 110) = -1 ECONNREFUSED (Connection refused)
> fprintd-fail-strace.log:Jun 30 05:52:41 ltcden8-lp6 strace[5595]: [pid  5599] 05:52:41 sendmsg(5, {msg_name={sa_family=AF_UNIX, sun_path="/run/systemd/journal/socket"}, msg_namelen=29, msg_iov=[{iov_base="GLIB_OLD_LOG_API", iov_len=16}, {iov_base="=", iov_len=1}, {iov_base="1", iov_len=1}, {iov_base="\n", iov_len=1}, {iov_base="MESSAGE", iov_len=7}, {iov_base="=", iov_len=1}, {iov_base="Failed to open connection to bus"..., iov_len=71}, {iov_base="\n", iov_len=1}, {iov_base="PRIORITY", iov_len=8}, {iov_base="=", iov_len=1}, {iov_base="4", iov_len=1}, {iov_base="\n", iov_len=1}, {iov_base="GLIB_DOMAIN", iov_len=11}, {iov_base="=", iov_len=1}, {iov_base="fprintd", iov_len=7}, {iov_base="\n", iov_len=1}], msg_iovlen=16, msg_controllen=0, msg_flags=0}, MSG_NOSIGNAL) = -1 ECONNREFUSED (Connection refused)
> 
> For working case connect works
> 
> fprintd-pass-strace.log:Jun 30 05:58:18 ltcden8-lp6 strace[2585]: [pid  2658] 05:58:18 connect(5, {sa_family=AF_UNIX, sun_path="/var/run/dbus/system_bus_socket"}, 110) = 0

Thank you for collecting logs!
I will take a look today.

Best regards,
Kuniyuki


> 
> 
> - Sachin
