Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C6C5607B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 19:49:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY89Y5F4kz3dsV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 03:49:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=D+k/1aYC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.co.jp (client-ip=207.171.190.10; helo=smtp-fw-33001.amazon.com; envelope-from=prvs=172ca6553=kuniyu@amazon.co.jp; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=D+k/1aYC;
	dkim-atps=neutral
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com [207.171.190.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY88s6CS4z308w
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 03:49:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1656524942; x=1688060942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZQt8BrZncvEXonYqD8ln2HEUss6QJGKaiw+Ny1S0QT4=;
  b=D+k/1aYCsgR0fX+reSQr5qgjcOaAvaLnxO9S3DRkpc4RbDa13iVvHs+o
   unYQe1phXbLpFhQm1DC6TMsha7jZqDTPUADm2AlYkb/bxezVMHHnrCFio
   VuxfA5sfs3unzO4A9HGV+QHkjXvV/ROH7hZx6eHk8qBXRFQlgPEl4MOpg
   M=;
X-IronPort-AV: E=Sophos;i="5.92,231,1650931200"; 
   d="scan'208";a="206136409"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-pdx-2a-5bed4ba5.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 29 Jun 2022 17:47:42 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2a-5bed4ba5.us-west-2.amazon.com (Postfix) with ESMTPS id 37F4B91D4A;
	Wed, 29 Jun 2022 17:47:40 +0000 (UTC)
Received: from EX13D04ANC001.ant.amazon.com (10.43.157.89) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Wed, 29 Jun 2022 17:47:39 +0000
Received: from 88665a182662.ant.amazon.com (10.43.160.95) by
 EX13D04ANC001.ant.amazon.com (10.43.157.89) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Wed, 29 Jun 2022 17:47:37 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <sachinp@linux.ibm.com>
Subject: Re: [powerpc] Fingerprint systemd service fails to start (next-20220624)
Date: Wed, 29 Jun 2022 10:47:29 -0700
Message-ID: <20220629174729.6744-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <FAA64E21-B3FE-442A-BA6B-D865006CBE3E@linux.ibm.com>
References: <FAA64E21-B3FE-442A-BA6B-D865006CBE3E@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.95]
X-ClientProxiedBy: EX13D48UWA001.ant.amazon.com (10.43.163.52) To
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
Date:   Tue, 28 Jun 2022 12:41:35 +0530
>>> I have attached dmesg log for reference. Let me know if any additional
>>> Information is required.
>> 
>> * Could you provide
>> * dmesg and /var/log/messages on a successful case? (without the commit)
>> * Unit file
>> * repro steps
> 
> I have attached the relevant log files. The attached tarball contains
> dmesg, /var/log/messages and strace o/p for fprintd service collected
> for working case and failure case.

Thanks for your help!


>> * Is it reproducible after login? (e.g. systemctl restart)
>> * If so, please provide
>> * the result of strace -t -ff
>> 
> Yes, the problem can be recreated after login. I have collected the strace
> logs.

I confirmed fprintd failed to launch with this message on failure case.

===
ltcden8-lp6 fprintd[2516]: (fprintd:2516): fprintd-WARNING **: 01:56:45.705: Failed to open connection to bus: Could not connect: Connection refused
===


But in the strace log of both cases, only one socket is created and
following connect() completes without an error.  And the peer socket
does not seem to be d-bus one.

===
$ cat working-case/strace-fprintd-service.log | grep "socket("
01:52:08 socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
$ cat working-case/strace-fprintd-service.log | grep "socket(" -A 10
01:52:08 socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
...
01:52:08 connect(3, {sa_family=AF_UNIX, sun_path="/run/systemd/private"}, 22) = 0
...
$ cat not-working-case/strace-fprintd-service.log | grep "socket("
01:58:14 socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
$ cat not-working-case/strace-fprintd-service.log | grep "socket(" -A 10
01:58:14 socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
...
01:58:14 connect(3, {sa_family=AF_UNIX, sun_path="/run/systemd/private"}, 22) = 0
===

So I think the error message part is not traced well.
Could you try to strace directly for the command in ExecStart section of
its unit file?


>> * Does it happen on only powerpc? How about x86 or arm64?
>> 
> I have attempted this only on powerpc. Don’t have access to arm or x86
> setup to attempt it.

I tried on my machine but fprintd launched successfully in both cases.
And few minutes later, it exited because there was no dedicated device for
fprintd, I think.

===
$ sudo systemctl status fprintd
● fprintd.service - Fingerprint Authentication Daemon
   Loaded: loaded (/usr/lib/systemd/system/fprintd.service; static; vendor preset: disabled)
   Active: inactive (dead)
     Docs: man:fprintd(1)

Jun 29 05:46:22 ip-10-0-0-163.ap-northeast-1.compute.internal systemd[1]: Starting Fingerprint Authentication Daemon...
Jun 29 05:46:22 ip-10-0-0-163.ap-northeast-1.compute.internal systemd[1]: Started Fingerprint Authentication Daemon.
Jun 29 05:46:22 ip-10-0-0-163.ap-northeast-1.compute.internal fprintd[1291]: Launching FprintObject
Jun 29 05:46:22 ip-10-0-0-163.ap-northeast-1.compute.internal fprintd[1291]: D-Bus service launched with name: net.reactivated.Fprint
Jun 29 05:46:22 ip-10-0-0-163.ap-northeast-1.compute.internal fprintd[1291]: entering main loop
Jun 29 05:46:52 ip-10-0-0-163.ap-northeast-1.compute.internal fprintd[1291]: No devices in use, exit
===
