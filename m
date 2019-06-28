Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEE959C6F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:03:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zxly4XdPzDqvW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 23:03:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="mTlEBBrJ"; 
 dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zxhw22kTzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 23:01:01 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id g18so4701003qkl.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 06:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AjYwhnBG/Zoj32JfaQGIXi4sKK1nLhc/V+pRPXqwjX0=;
 b=mTlEBBrJSlVUpqvo7/0G83f2mzK41lO4C5JAHXSCHn6kvGH3SPSPk8+Z7ZkasRHDuE
 j7ofsaK4zPNm89xFigonz4rfE0YEhzpZydNIHc2rfVlYJuFkvS39e51q/eCDw9xTU0Xf
 xYPWjGazZZD8lSP5y9jWyQwFLr1IPnj1YkYu/2CBT81GjJNqjxr6GuEIRTntmMcX1iLV
 KAiFjL4uvyBFzq/ksPyGnBQ9LBk2PIjn6Tk2n9gWj3zLvI+860RMgHUxSTHB+L9eoD1R
 2UUnzYBJFSXu9Y/REp1mvWuiripC4woYJ6nhmT3qdEaOUOoyaySWaH0xY4tV9gLgzBp8
 zl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AjYwhnBG/Zoj32JfaQGIXi4sKK1nLhc/V+pRPXqwjX0=;
 b=mbNYV5QXTcClYtMlSZfcD573AVDPfCbsUGcgJpBR0TT6HAv0xxdQDXoV+AiB6VPqie
 ql1pU84DqWNRBbzX2TzZTD8koJpb+y/jj35rPdzZvSZz5AdJTRS9U+mZu8Ocb3izShHz
 Rdp08mE/Ibk0EOO7uT/bmRrCobHxCn9yq548RAs+TupeICUxUorGgVmphiD6QVJInZJC
 PY6DPgzveHATHR/NcVoiXqW0JpclwJCZ23ZAa3PU/ZdtXVb0XehiDlpa2q/u6dttuIOc
 YQ3Qw9k6QPcxFLYspzAx7nj02REEJY2PJ+2WOroL0QhrNl+3wnBvjoapl7c4Jw7WNoTW
 zJAg==
X-Gm-Message-State: APjAAAWQv3FiCPcJ2321ZyuEEniA/DbEJGsDgnJ95B/9RrUreEIffc5l
 G9dR7N0ctl4cDzK+vwYSWWiuSA==
X-Google-Smtp-Source: APXvYqyaKT5j9r1iBViaL1lWqd0o4YriLf++bZ6JVQGu0yYj0QOQfu8NbfSruBEAQ0Oj1abIjOBCkg==
X-Received: by 2002:a37:f505:: with SMTP id l5mr8770978qkk.235.1561726856356; 
 Fri, 28 Jun 2019 06:00:56 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id e18sm893339qkm.49.2019.06.28.06.00.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 06:00:55 -0700 (PDT)
Message-ID: <1561726853.5154.100.camel@lca.pw>
Subject: Re: power9 NUMA crash while reading debugfs imc_cmd
From: Qian Cai <cai@lca.pw>
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Date: Fri, 28 Jun 2019 09:00:53 -0400
In-Reply-To: <9c87dc72-54f8-8510-c400-1e89779cc88b@linux.vnet.ibm.com>
References: <1561670472.5154.98.camel@lca.pw>
 <87lfxms8r3.fsf@concordia.ellerman.id.au>
 <715A934D-EE3A-478B-BA77-589C539FC52D@lca.pw>
 <9c87dc72-54f8-8510-c400-1e89779cc88b@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-06-28 at 17:19 +0530, Anju T Sudhakar wrote:
> On 6/28/19 9:04 AM, Qian Cai wrote:
> > 
> > > On Jun 27, 2019, at 11:12 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> > > 
> > > Qian Cai <cai@lca.pw> writes:
> > > > Read of debugfs imc_cmd file for a memory-less node will trigger a crash
> > > > below
> > > > on this power9 machine which has the following NUMA layout.
> > > 
> > > What type of machine is it?
> > 
> > description: PowerNV
> > product: 8335-GTH (ibm,witherspoon)
> > vendor: IBM
> > width: 64 bits
> > capabilities: smp powernv opal
> 
> 
> Hi Qian Cai,
> 
> Could you please try with this patch: 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-June/192803.html
> 
> and see if the issue is resolved?

It works fine.

Just feel a bit silly that a node without CPU and memory is still online by
default during boot at the first place on powerpc, but that is probably a
different issue. For example,

# numactl -H
available: 6 nodes (0,8,252-255)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52
53 54 55 56 57 58 59 60 61 62 63
node 0 size: 126801 MB
node 0 free: 123199 MB
node 8 cpus: 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85
86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108
109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
node 8 size: 130811 MB
node 8 free: 128436 MB
node 252 cpus:
node 252 size: 0 MB
node 252 free: 0 MB
node 253 cpus:
node 253 size: 0 MB
node 253 free: 0 MB
node 254 cpus:
node 254 size: 0 MB
node 254 free: 0 MB
node 255 cpus:
node 255 size: 0 MB
node 255 free: 0 MB
node distances:
node   0   8  252  253  254  255 
  0:  10  40  80  80  80  80 
  8:  40  10  80  80  80  80 
 252:  80  80  10  80  80  80 
 253:  80  80  80  10  80  80 
 254:  80  80  80  80  10  80 
 255:  80  80  80  80  80  10 

# cat /sys/devices/system/node/online 
0,8,252-255



