Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ADA74EC88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:21:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b1nsnyWJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0dk12QLqz2x9L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:21:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b1nsnyWJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0cj124xrz303l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 20:35:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D9A061457;
	Tue, 11 Jul 2023 10:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400C3C433C8;
	Tue, 11 Jul 2023 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689071746;
	bh=RdirUcCE2pA/1z8207uTNCXjhMGAcU2jC5JA2KzMRoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1nsnyWJfs1mcjVYHJe+HEUCi0LN15hY99BnaXhtfz0oB3h8EzQMDa9aeEPB4cHsG
	 m0hzpx+fMmsE8WzKuxURAUSYoPOk1yyNeGjKmk6Oo1T+sxizOWkbUk2lnWZeZJq/OR
	 t35F+euEtnNr2grYlFD6oJ2MJWvp/QNNOG1DuAJeBI5VAMb7y9WA/nlkd3eUTkr2Lb
	 BRvBfq7P9mdE+wM/H6F8uotrR4TMskih7C1j7iuXPsrtoxNhX7cAuYqxh5Z1V2YE+p
	 NfC0fI8jKAJTifgfTIIMFJicOPaZ5ZezvtKLTLYQgP5kZnonqVF+tNhSPdx4zGnzF9
	 S3WTHtdee7iTg==
Date: Tue, 11 Jul 2023 13:35:41 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Sachin Sant <sachinp@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 00/33] Per-VMA locks
Message-ID: <20230711103541.GA190975@unreal>
References: <20230227173632.3292573-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
X-Mailman-Approved-At: Tue, 11 Jul 2023 21:21:01 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, Linux kernel regressions list <regressions@lists.linux.dev>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, sergeyy@nvidia.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, gal@nvidia.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, maorg@nvidia.com, ranro@nvidia.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, regressions@leemhuis.info, shakeelb@google.com, drort@nvidia.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google
 .com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, idok@nvidia.com, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Mon, Feb 27, 2023 at 09:35:59AM -0800, Suren Baghdasaryan wrote:

<...>

> Laurent Dufour (1):
>   powerc/mm: try VMA lock-based page fault handling first

Hi,

This series and specifically the commit above broke docker over PPC.
It causes to docker service stuck while trying to activate. Revert of
this commit allows us to use docker again.

[user@ppc-135-3-200-205 ~]# sudo systemctl status docker
=E2=97=8F docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendo=
r preset: disabled)
     Active: activating (start) since Mon 2023-06-26 14:47:07 IDT; 3h 50min=
 ago
TriggeredBy: =E2=97=8F docker.socket
       Docs: https://docs.docker.com
   Main PID: 276555 (dockerd)
     Memory: 44.2M
     CGroup: /system.slice/docker.service
             =E2=94=94=E2=94=80 276555 /usr/bin/dockerd -H fd:// --containe=
rd=3D/run/containerd/containerd.sock

Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time=3D"2023-06-26T14:47=
:07.129383166+03:00" level=3Dinfo msg=3D"Graph migration to content-address=
ability took 0.00 se>
Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time=3D"2023-06-26T14:47=
:07.129666160+03:00" level=3Dwarning msg=3D"Your kernel does not support cg=
roup cfs period"
Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time=3D"2023-06-26T14:47=
:07.129684117+03:00" level=3Dwarning msg=3D"Your kernel does not support cg=
roup cfs quotas"
Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time=3D"2023-06-26T14:47=
:07.129697085+03:00" level=3Dwarning msg=3D"Your kernel does not support cg=
roup rt period"
Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time=3D"2023-06-26T14:47=
:07.129711513+03:00" level=3Dwarning msg=3D"Your kernel does not support cg=
roup rt runtime"
Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time=3D"2023-06-26T14:47=
:07.129720656+03:00" level=3Dwarning msg=3D"Unable to find blkio cgroup in =
mounts"
Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time=3D"2023-06-26T14:47=
:07.129805617+03:00" level=3Dwarning msg=3D"mountpoint for pids not found"
Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time=3D"2023-06-26T14:47=
:07.130199070+03:00" level=3Dinfo msg=3D"Loading containers: start."
Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time=3D"2023-06-26T14:47=
:07.132688568+03:00" level=3Dwarning msg=3D"Running modprobe bridge br_netf=
ilter failed with me>
Jun 26 14:47:07 ppc-135-3-200-205 dockerd[276555]: time=3D"2023-06-26T14:47=
:07.271014050+03:00" level=3Dinfo msg=3D"Default bridge (docker0) is assign=
ed with an IP addres>

Python script which we used for bisect:

import subprocess
import time
import sys


def run_command(cmd):
    print('running:', cmd)

    p =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3Dsubprocess.PIPE, std=
err=3Dsubprocess.PIPE)

    try:
        stdout, stderr =3D p.communicate(timeout=3D30)

    except subprocess.TimeoutExpired:
        return True

    print(stdout.decode())
    print(stderr.decode())
    print('rc:', p.returncode)

    return False


def main():
    commands =3D [
        'sudo systemctl stop docker',
        'sudo systemctl status docker',
        'sudo systemctl is-active docker',
        'sudo systemctl start docker',
        'sudo systemctl status docker',
    ]

    for i in range(1000):
        title =3D f'Try no. {i + 1}'
        print('*' * 50, title, '*' * 50)

        for cmd in commands:
            if run_command(cmd):
                print(f'Reproduced on try no. {i + 1}!')
                print(f'"{cmd}" is stuck!')

                return 1

            print('\n')
        time.sleep(30)
    return 0

if __name__ =3D=3D '__main__':
    sys.exit(main())

Thanks
