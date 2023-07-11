Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E486974EBF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 12:49:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=15QFgDP0;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CZrjNXKF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0d1F5p0tz3bmb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 20:49:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=15QFgDP0;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CZrjNXKF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=suse.cz (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 560 seconds by postgrey-1.37 at boromir; Tue, 11 Jul 2023 20:49:06 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0d0L3vhrz2yKy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 20:49:05 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3CDEF22239;
	Tue, 11 Jul 2023 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1689071975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=44KBJ+1im2SseuOl7OurwU90VSfXsPuN6bOH+bmXMeo=;
	b=15QFgDP0OdSUp15wD7dzXcVtUkcaDFUKAcnNES6oIaMueCQa6cLRd58w86K+vVp2fsVbXU
	QJHX0+k8um8wKtzxJugLV1Hb+jNABsbH8ZGWC8SZnaCnms4ESHK84aP3s8G1hdAwr+vaGl
	BHv6v6YQxuJIujgMuiQM4ADEqUdgbxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1689071975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=44KBJ+1im2SseuOl7OurwU90VSfXsPuN6bOH+bmXMeo=;
	b=CZrjNXKFDXgYrYygDLRtrle2FjF/Qex3slwU7zDZ5Xdu8iStTHkyJzqsBjj68JblYwAx7f
	9/z6X8qmt/DeosBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73DB31391C;
	Tue, 11 Jul 2023 10:39:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Cgw0G2YxrWTnfwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Tue, 11 Jul 2023 10:39:34 +0000
Message-ID: <53676850-539f-2813-d55d-a8bc0ec88092@suse.cz>
Date: Tue, 11 Jul 2023 12:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/33] Per-VMA locks
To: Leon Romanovsky <leon@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Laurent Dufour <ldufour@linux.ibm.com>,
 Sachin Sant <sachinp@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230711103541.GA190975@unreal>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20230711103541.GA190975@unreal>
Content-Type: text/plain; charset=UTF-8
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, Linux kernel regressions list <regressions@lists.linux.dev>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, sergeyy@nvidia.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, gal@nvidia.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, maorg@nvidia.com, ranro@nvidia.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, regressions@leemhuis.info, shakeelb@google.com, drort@nvidia.com, luto@kernel.org, gthelen@google.com, linux-arm-kernel@lists.infradead.org, posk@google.com, lstoakes@gmail.com, peterjung1337
 @gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, idok@nvidia.com, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/11/23 12:35, Leon Romanovsky wrote:
> 
> On Mon, Feb 27, 2023 at 09:35:59AM -0800, Suren Baghdasaryan wrote:
> 
> <...>
> 
>> Laurent Dufour (1):
>>   powerc/mm: try VMA lock-based page fault handling first
> 
> Hi,
> 
> This series and specifically the commit above broke docker over PPC.
> It causes to docker service stuck while trying to activate. Revert of
> this commit allows us to use docker again.

Hi,

there have been follow-up fixes, that are part of 6.4.3 stable (also
6.5-rc1) Does that version work for you?

Vlastimil

> [user@ppc-135-3-200-205 ~]# sudo systemctl status docker
> ● docker.service - Docker Application Container Engine
>      Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
>      Active: activating (start) since Mon 2023-06-26 14:47:07 IDT; 3h 50min ago
> TriggeredBy: ● docker.socket
>        Docs: https://docs.docker.com
>    Main PID: 276555 (dockerd)
>      Memory: 44.2M
>      CGroup: /system.slice/docker.service
>              └─ 276555 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
> 
> Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time="2023-06-26T14:47:07.129383166+03:00" level=info msg="Graph migration to content-addressability took 0.00 se>
> Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time="2023-06-26T14:47:07.129666160+03:00" level=warning msg="Your kernel does not support cgroup cfs period"
> Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time="2023-06-26T14:47:07.129684117+03:00" level=warning msg="Your kernel does not support cgroup cfs quotas"
> Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time="2023-06-26T14:47:07.129697085+03:00" level=warning msg="Your kernel does not support cgroup rt period"
> Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time="2023-06-26T14:47:07.129711513+03:00" level=warning msg="Your kernel does not support cgroup rt runtime"
> Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time="2023-06-26T14:47:07.129720656+03:00" level=warning msg="Unable to find blkio cgroup in mounts"
> Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time="2023-06-26T14:47:07.129805617+03:00" level=warning msg="mountpoint for pids not found"
> Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time="2023-06-26T14:47:07.130199070+03:00" level=info msg="Loading containers: start."
> Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time="2023-06-26T14:47:07.132688568+03:00" level=warning msg="Running modprobe bridge br_netfilter failed with me>
> Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time="2023-06-26T14:47:07.271014050+03:00" level=info msg="Default bridge (docker0) is assigned with an IP addres>
> 
> Python script which we used for bisect:
> 
> import subprocess
> import time
> import sys
> 
> 
> def run_command(cmd):
>     print('running:', cmd)
> 
>     p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> 
>     try:
>         stdout, stderr = p.communicate(timeout=30)
> 
>     except subprocess.TimeoutExpired:
>         return True
> 
>     print(stdout.decode())
>     print(stderr.decode())
>     print('rc:', p.returncode)
> 
>     return False
> 
> 
> def main():
>     commands = [
>         'sudo systemctl stop docker',
>         'sudo systemctl status docker',
>         'sudo systemctl is-active docker',
>         'sudo systemctl start docker',
>         'sudo systemctl status docker',
>     ]
> 
>     for i in range(1000):
>         title = f'Try no. {i + 1}'
>         print('*' * 50, title, '*' * 50)
> 
>         for cmd in commands:
>             if run_command(cmd):
>                 print(f'Reproduced on try no. {i + 1}!')
>                 print(f'"{cmd}" is stuck!')
> 
>                 return 1
> 
>             print('\n')
>         time.sleep(30)
>     return 0
> 
> if __name__ == '__main__':
>     sys.exit(main())
> 
> Thanks

