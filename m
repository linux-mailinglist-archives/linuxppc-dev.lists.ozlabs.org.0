Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB85180617
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 19:21:36 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cNhY6MgGzDqT8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 05:21:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.196;
 helo=mail-qk1-f196.google.com; envelope-from=arnaldo.melo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nn0IsAwn; dkim-atps=neutral
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cNdN69C7zDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 05:18:48 +1100 (AEDT)
Received: by mail-qk1-f196.google.com with SMTP id b5so13675277qkh.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 11:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FDcMX1PePznyO53o+CArnNkwwdbPpxO8cnWHJEtCj+w=;
 b=nn0IsAwnKmmT34whzS9D7vKKkobczy4+Jxv15WjpHhMcBo1iiSXUhNZ5zfQV7rhPJ+
 BdKtWzLr2klQ4aM0rvu22HimGCGL9E5oxIC4bQAxUgCtV9abiaMR061IWgp3G6slG26L
 ZvaFCGXif+EiTWwqW1Tb8/JCtJCOpSem0oPp+FHG7Qf2KhEi585uzhlL324shD/cToA5
 cbAETcjOTJzOa1Ncn2t1AzDau/faVKd34tpUQGZrqrj2z9YlTgKRUAkR7EE2VTyufKKd
 fKd5NMEYQJS30mQwg3bXHMAuMZOC8XoKsbWxYLD3Wbg8WYu1NquHHuYC+/q3MI3bKYcL
 /sEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FDcMX1PePznyO53o+CArnNkwwdbPpxO8cnWHJEtCj+w=;
 b=Js11zQ0mvk53ZBBp1Y4HW/INHhOsm4XorxNAA+VIDzse+ZkXgVXD3++CvOfmVrXoAk
 boctte/vZapISeYN15rXDLEV2ypEMmb7nR/TIYmFEQwM+pNvh+x8wTrnKRtL6EpgL0oL
 Mrh7f2I0E9Jwjq+JT0kYbNvjiLqy3m7IYn1BmqG7m9wpY78s3MKAB99sXXezvUqzOAfG
 rowMX8q/YsCKY7aobw1wbvjKwcTJjXD3IM4sNsjrAL2yRjWHcDuhyj4l/3N5uo7YJ6QY
 JRAG7KJrMp4jNw81Pl2QGBw4fNKsaxaqFDkOjn18bUPq0+HR4FcqxRpB5pdoI5ogkRa3
 eyYg==
X-Gm-Message-State: ANhLgQ2gqn+Ug3X+LRMQkalIbahi0Y9B7aHTYJbBCByAZVyzNtDdWH5a
 sOQwjDjUiciilZqLuRhl6S0=
X-Google-Smtp-Source: ADFU+vvDQ6OVjY8tJy/nZ0hNWyGRHkLWwyU0bDUoyYD7chInzxdBRC6g6UidRbT/w0mvlFmonWPVGw==
X-Received: by 2002:a37:6e84:: with SMTP id j126mr19916576qkc.77.1583864322670; 
 Tue, 10 Mar 2020 11:18:42 -0700 (PDT)
Received: from quaco.ghostprotocols.net (179-240-149-111.3g.claro.net.br.
 [179.240.149.111])
 by smtp.gmail.com with ESMTPSA id r46sm8420598qtb.87.2020.03.10.11.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 11:18:41 -0700 (PDT)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 99BF840009; Tue, 10 Mar 2020 15:18:36 -0300 (-03)
Date: Tue, 10 Mar 2020 15:18:36 -0300
To: Jiri Olsa <jolsa@redhat.com>
Subject: Re: [PATCH v4 0/8] powerpc/perf: Add json file metric support for
 the hv_24x7 socket/chip level events
Message-ID: <20200310181836.GA12036@kernel.org>
References: <20200309062552.29911-1-kjain@linux.ibm.com>
 <20200309093506.GB67774@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309093506.GB67774@krava>
X-Url: http://acmel.wordpress.com
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com,
 Kajol Jain <kjain@linux.ibm.com>, jmario@redhat.com, namhyung@kernel.org,
 tglx@linutronix.de, mpetlan@redhat.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Mar 09, 2020 at 10:35:06AM +0100, Jiri Olsa escreveu:
> On Mon, Mar 09, 2020 at 11:55:44AM +0530, Kajol Jain wrote:
> > First patch of the patchset fix inconsistent results we are getting when
> > we run multiple 24x7 events.
> > 
> > Patchset adds json file metric support for the hv_24x7 socket/chip level
> > events. "hv_24x7" pmu interface events needs system dependent parameter
> > like socket/chip/core. For example, hv_24x7 chip level events needs
> > specific chip-id to which the data is requested should be added as part
> > of pmu events.
> > 
> > So to enable JSON file support to "hv_24x7" interface, patchset expose
> > total number of sockets and chips per-socket details in sysfs
> > files (sockets, chips) under "/sys/devices/hv_24x7/interface/".
> > 
> > To get sockets and number of chips per sockets, patchset adds a rtas call
> > with token "PROCESSOR_MODULE_INFO" to get these details. Patchset also
> > handles partition migration case to re-init these system depended
> > parameters by adding proper calls in post_mobility_fixup() (mobility.c).
> > 
> > Patch 6 & 8 of the patchset handles perf tool plumbing needed to replace
> > the "?" character in the metric expression to proper value and hv_24x7
> > json metric file for different Socket/chip resources.
> > 
> > Patch set also enable Hz/hz prinitg for --metric-only option to print
> > metric data for bus frequency.
> > 
> > Applied and tested all these patches cleanly on top of jiri's flex changes
> > with the changes done by Kan Liang for "Support metric group constraint"
> > patchset and made required changes.
> > 
> > Changelog:
> > v3 -> v4
> > - Made changes suggested by jiri.
> 
> could you please mention them next time? ;-)
> 
> > - Apply these patch on top of Kan liang changes.
> 
> Arnaldo, could you please pull the expr flex changes and Kan's
> metric group constraint changes? it's both prereq of this patchset

Both are now in my perf/core branch, will go upstream soon, should I go
and pickup the perf tooling bits in this patchkit?

- Arnaldo
