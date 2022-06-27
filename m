Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFBF55BCB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 02:32:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX5C06sPDz3drD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 10:32:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=Ps3wGEfs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.co.jp (client-ip=99.78.197.218; helo=smtp-fw-80007.amazon.com; envelope-from=prvs=170e7b5d7=kuniyu@amazon.co.jp; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=Ps3wGEfs;
	dkim-atps=neutral
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWv794TFnz3bfc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 02:58:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1656349093; x=1687885093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y6XvG9/U51igKius4IaKDqx8Gy6lPi0Xal5PaG7hwgI=;
  b=Ps3wGEfsMotlnYCdBNy1p4HuqqVp8zdWff7hUvzf2Sg22GMaUt1fvi1I
   USE4t+ua2LX4zDp3Ujqs3InpiJLXLpvp83wY0rS/Qyc0hj5Sm01Z3p7F5
   a7DKLqO9lk2URTeXhn/v5Jox4YBXg65HC2jb27bKBJHP7FzdshLgDJGll
   M=;
X-IronPort-AV: E=Sophos;i="5.92,226,1650931200"; 
   d="scan'208";a="102367407"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP; 27 Jun 2022 16:36:54 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com (Postfix) with ESMTPS id 7A9C4A2BB3;
	Mon, 27 Jun 2022 16:36:52 +0000 (UTC)
Received: from EX13D04ANC001.ant.amazon.com (10.43.157.89) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Mon, 27 Jun 2022 16:36:51 +0000
Received: from 88665a182662.ant.amazon.com.com (10.43.160.124) by
 EX13D04ANC001.ant.amazon.com (10.43.157.89) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Mon, 27 Jun 2022 16:36:49 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <sachinp@linux.ibm.com>
Subject: Re: [powerpc] Fingerprint systemd service fails to start (next-20220624)
Date: Mon, 27 Jun 2022 09:36:40 -0700
Message-ID: <20220627163640.74890-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <B2AA3091-796D-475E-9A11-0021996E1C00@linux.ibm.com>
References: <B2AA3091-796D-475E-9A11-0021996E1C00@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.124]
X-ClientProxiedBy: EX13D07UWB001.ant.amazon.com (10.43.161.238) To
 EX13D04ANC001.ant.amazon.com (10.43.157.89)
Precedence: Bulk
X-Mailman-Approved-At: Tue, 28 Jun 2022 10:29:05 +1000
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

Hi Sachin,
Thanks for the report.

From:   Sachin Sant <sachinp@linux.ibm.com>
Date:   Mon, 27 Jun 2022 10:28:27 +0530
> With the latest -next I have observed a peculiar issue on IBM Power
> server running -next(5.19.0-rc3-next-20220624) .
> 
> Fingerprint authentication systemd service (fprintd) fails to start while
> attempting OS login after kernel boot. There is a visible delay of 18-20
> seconds before being prompted for OS login password.
> 
> Kernel 5.19.0-rc3-next-20220624 on an ppc64le
> 
> ltcden8-lp6 login: root
> <<=======.  delay of 18-20 seconds
> Password: 
> 
> Following messages(fprintd service) are seen in /var/log/messages:
> 
> systemd[1]: Startup finished in 1.842s (kernel) + 1.466s (initrd) + 29.230s (userspace) = 32.540s.

It seems the kernel finishes its job immediately but userspace takes more
time on retrying or something.  The service_start_timeout seems to be the
timeout period.


> NetworkManager[1100]: <info>  [1656304146.6686] manager: startup complete
> dbus-daemon[1027]: [system] Activating via systemd: service name='net.reactivated.Fprint' unit='fprintd.service' requested by ':1.21' (uid=0 pid=1502 comm="/bin/login -p --      ")
> systemd[1]: Starting Fingerprint Authentication Daemon...
> fprintd[2521]: (fprintd:2521): fprintd-WARNING **: 00:29:08.568: Failed to open connection to bus: Could not connect: Connection refused

I think this message comes from here.
https://github.com/freedesktop/libfprint-fprintd/blob/master/src/main.c#L183-L189

I'm not sure what the program does though, I guess it failed to find a peer
socket in the hash table while calling connect()/sendmsg() syscalls and got
-ECONNREFUSED in unix_find_bsd() or unix_find_abstract().


> systemd[1]: fprintd.service: Main process exited, code=exited, status=1/FAILURE
> systemd[1]: fprintd.service: Failed with result 'exit-code'.
> systemd[1]: Failed to start Fingerprint Authentication Daemon.
> dbus-daemon[1027]: [system] Failed to activate service 'net.reactivated.Fprint': timed out (service_start_timeout=25000ms)
> 
> Mainline (5.19.0-rc3) or older -next does not have this problem.
> 
> Git bisect between mainline & -next points to the following patch:
> 
> # git bisect bad
> cf2f225e2653734e66e91c09e1cbe004bfd3d4a7 is the first bad commit
> commit cf2f225e2653734e66e91c09e1cbe004bfd3d4a7
> 
> Date:   Tue Jun 21 10:19:12 2022 -0700
> 
>     af_unix: Put a socket into a per-netns hash table.
> 
> I don’t know how the above identified patch is related to the failure,
> but given that I can consistently recreate the issue assume the bisect
> result can be trusted.

Before the commit, all of sockets on the host are linked in a global hash
table, and after the commit, they are linked in their network namespace's
hash table.  So, I believe there is no change visible to userspace.


> I have attached dmesg log for reference. Let me know if any additional
> Information is required.

* Could you provide
  * dmesg and /var/log/messages on a successful case? (without the commit)
  * Unit file
  * repro steps

* Is it reproducible after login? (e.g. systemctl restart)
  * If so, please provide
    * the result of strace -t -ff

* Does it happen on only powerpc? How about x86 or arm64?

* What does the service does?
  * connect() or sendmsg()
  * protocol family
  * abstract or BSD socket

Best regards,
Kuniyuki

