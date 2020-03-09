Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C661E17E101
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 14:25:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bf8J0fvszDqV1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 00:24:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.170;
 helo=mail-qk1-f170.google.com; envelope-from=arnaldo.melo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kcbf1gpP; dkim-atps=neutral
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bbTv0RS5zDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Mar 2020 22:24:31 +1100 (AEDT)
Received: by mail-qk1-f170.google.com with SMTP id y126so8779495qke.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2020 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=87R1n5GHT05Dw43kEPO5QbfCk7rM5ACa/sVdjekbCLk=;
 b=Kcbf1gpPIJTuTtA/N5tTEJGF0bhMinZE/jrHVNmrx3r82Jlem+l+EfBWIhA3jgRc/6
 bwM4qUaHpO1G2rA992+G9tSLla4RUtszyAUZNYRuXag4xEfaBufMmQNAggyN7FiipqW3
 DBHyok19gNF/H1XEtrmNO9JY6hp2V4H8vvWFycsSSmkrAzCGMlrOOduGVdKHHvy+v8TQ
 3d9PSu0O4COCIvUdfjImhbsJowunbS+ssfMyDwO4upZlnzHxuDioecGZnSHUabCl7hOB
 lWDknvgIXHqOTyrk6ILAEVDF1q45b66uD2J9cTYHAaHC2lcBGbS9E4tZgPoEgWBST3E9
 B0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=87R1n5GHT05Dw43kEPO5QbfCk7rM5ACa/sVdjekbCLk=;
 b=ZqPEeghhcJkvkpya07zmeRPeyMe4dAb65BuyPL8gYh51UndwvKY4IO5Ry+sJPX546A
 +J2Z1M+ETEAWtK8f796Ug4EHhIUyc+fphzYABer85OQ/QKhmpGMLVkWtPJZ426ZWoqSA
 KirdhTeWXqrB8Wk+18sroThTuU2sfx5m9Ie7RpwP8e6YzH8zW5+DpWxY9gfCw0AUlE9a
 0stwEJsHe3QWIoc2wIyJyR457T3E+G16FHrIDlbB+5R+WpP0K0wP3t0xNvbwCnziuOtM
 4CJWOhHrAf3T4uDPj8s1Im4QwgA313jPD6OTfgDXNZCRHOwMU6YIhrpIvuHIgjM0aXqG
 h+0g==
X-Gm-Message-State: ANhLgQ1U7/xQYp/WtOKvG8df6JB3DMxKFVh2jfU3QbS67jTahey2HO1M
 MMdMf04n4Zow9nRJYcRn+VQ=
X-Google-Smtp-Source: ADFU+vsJ9ZcwLWcSy94eGUH/I5dzI+Wb5kTsWGIkR/hn7uMjskNsJSl9B5nIsjRB1eXf/wIMVa6IHQ==
X-Received: by 2002:a05:620a:529:: with SMTP id
 h9mr5124192qkh.142.1583753006927; 
 Mon, 09 Mar 2020 04:23:26 -0700 (PDT)
Received: from [192.168.86.185] ([179.97.37.151])
 by smtp.gmail.com with ESMTPSA id x11sm8337400qkf.67.2020.03.09.04.23.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Mar 2020 04:23:26 -0700 (PDT)
Date: Mon, 09 Mar 2020 08:22:58 -0300
User-Agent: K-9 Mail for Android
In-Reply-To: <20200309093506.GB67774@krava>
References: <20200309062552.29911-1-kjain@linux.ibm.com>
 <20200309093506.GB67774@krava>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----270YK9CK95ZFO6JEK6BIIT4MHMOD1S"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 0/8] powerpc/perf: Add json file metric support for the
 hv_24x7 socket/chip level events
To: Jiri Olsa <jolsa@redhat.com>,Kajol Jain <kjain@linux.ibm.com>
From: Arnaldo Melo <arnaldo.melo@gmail.com>
Message-ID: <A2F32D56-CCD0-4D5E-ACAA-710AD91635AC@gmail.com>
X-Mailman-Approved-At: Tue, 10 Mar 2020 00:20:38 +1100
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
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com, acme@kernel.org,
 jmario@redhat.com, namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

------270YK9CK95ZFO6JEK6BIIT4MHMOD1S
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sure, will do it today

On March 9, 2020 6:35:06 AM GMT-03:00, Jiri Olsa <jolsa@redhat=2Ecom> wrot=
e:
>On Mon, Mar 09, 2020 at 11:55:44AM +0530, Kajol Jain wrote:
>> First patch of the patchset fix inconsistent results we are getting
>when
>> we run multiple 24x7 events=2E
>>=20
>> Patchset adds json file metric support for the hv_24x7 socket/chip
>level
>> events=2E "hv_24x7" pmu interface events needs system dependent
>parameter
>> like socket/chip/core=2E For example, hv_24x7 chip level events needs
>> specific chip-id to which the data is requested should be added as
>part
>> of pmu events=2E
>>=20
>> So to enable JSON file support to "hv_24x7" interface, patchset
>expose
>> total number of sockets and chips per-socket details in sysfs
>> files (sockets, chips) under "/sys/devices/hv_24x7/interface/"=2E
>>=20
>> To get sockets and number of chips per sockets, patchset adds a rtas
>call
>> with token "PROCESSOR_MODULE_INFO" to get these details=2E Patchset
>also
>> handles partition migration case to re-init these system depended
>> parameters by adding proper calls in post_mobility_fixup()
>(mobility=2Ec)=2E
>>=20
>> Patch 6 & 8 of the patchset handles perf tool plumbing needed to
>replace
>> the "?" character in the metric expression to proper value and
>hv_24x7
>> json metric file for different Socket/chip resources=2E
>>=20
>> Patch set also enable Hz/hz prinitg for --metric-only option to print
>> metric data for bus frequency=2E
>>=20
>> Applied and tested all these patches cleanly on top of jiri's flex
>changes
>> with the changes done by Kan Liang for "Support metric group
>constraint"
>> patchset and made required changes=2E
>>=20
>> Changelog:
>> v3 -> v4
>> - Made changes suggested by jiri=2E
>
>could you please mention them next time? ;-)
>
>> - Apply these patch on top of Kan liang changes=2E
>
>Arnaldo, could you please pull the expr flex changes and Kan's
>metric group constraint changes? it's both prereq of this patchset
>
>thanks,
>jirka

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
------270YK9CK95ZFO6JEK6BIIT4MHMOD1S
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Sure, will do it today<br><br><div class=3D"gmail_=
quote">On March 9, 2020 6:35:06 AM GMT-03:00, Jiri Olsa &lt;jolsa@redhat=2E=
com&gt; wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0p=
t 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">On Mon, Mar 09, 2020 at 11:55:44AM +0530, Kajol Jain=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=
=2E8ex; border-left: 1px solid #729fcf; padding-left: 1ex;">First patch of =
the patchset fix inconsistent results we are getting when<br>we run multipl=
e 24x7 events=2E<br><br>Patchset adds json file metric support for the hv_2=
4x7 socket/chip level<br>events=2E "hv_24x7" pmu interface events needs sys=
tem dependent parameter<br>like socket/chip/core=2E For example, hv_24x7 ch=
ip level events needs<br>specific chip-id to which the data is requested sh=
ould be added as part<br>of pmu events=2E<br><br>So to enable JSON file sup=
port to "hv_24x7" interface, patchset expose<br>total number of sockets and=
 chips per-socket details in sysfs<br>files (sockets, chips) under "/sys/de=
vices/hv_24x7/interface/"=2E<br><br>To get sockets and number of chips per =
sockets, patchset adds a rtas call<br>with token "PROCESSOR_MODULE_INFO" to=
 get these details=2E Patchset also<br>handles partition migration case to =
re-init these system depended<br>parameters by adding proper calls in post_=
mobility_fixup() (mobility=2Ec)=2E<br><br>Patch 6 &amp; 8 of the patchset h=
andles perf tool plumbing needed to replace<br>the "?" character in the met=
ric expression to proper value and hv_24x7<br>json metric file for differen=
t Socket/chip resources=2E<br><br>Patch set also enable Hz/hz prinitg for -=
-metric-only option to print<br>metric data for bus frequency=2E<br><br>App=
lied and tested all these patches cleanly on top of jiri's flex changes<br>=
with the changes done by Kan Liang for "Support metric group constraint"<br=
>patchset and made required changes=2E<br><br>Changelog:<br>v3 -&gt; v4<br>=
- Made changes suggested by jiri=2E<br></blockquote><br>could you please me=
ntion them next time? ;-)<br><br><blockquote class=3D"gmail_quote" style=3D=
"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-left:=
 1ex;">- Apply these patch on top of Kan liang changes=2E<br></blockquote><=
br>Arnaldo, could you please pull the expr flex changes and Kan's<br>metric=
 group constraint changes? it's both prereq of this patchset<br><br>thanks,=
<br>jirka<br><br></pre></blockquote></div><br>-- <br>Sent from my Android d=
evice with K-9 Mail=2E Please excuse my brevity=2E</body></html>
------270YK9CK95ZFO6JEK6BIIT4MHMOD1S--
