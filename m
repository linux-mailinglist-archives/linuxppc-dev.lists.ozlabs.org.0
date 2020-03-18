Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E421895A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 07:20:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j0JM1MBGzDqv6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 17:20:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=JN2lcZK8; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j0Gj2tHJzDqWR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 17:18:36 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id v13so883326pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 23:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=rK0hZkTKVx76EEECSYyaEEZ50rQ8x/KfXEt2npuCiqs=;
 b=JN2lcZK8dX/QUKNSd+IEuqnSbAV8++0Gweztiwyahi+osWl4REh5gg59r92YUzmy9L
 ZYx6NZTBSxfeX0V2F+fuFhFv1T0ciOebCqXuNNW4XYqUqJTgD9iP9bVZPsdC1ydtjEFA
 4dv2t+CpLE7Q5d2J8bZtfNAYcZVMod/N4z18s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rK0hZkTKVx76EEECSYyaEEZ50rQ8x/KfXEt2npuCiqs=;
 b=hhfM2jmGbgs0XyUP9CCROLVh2ERzZsf9Ska9tRdJA5n7oiZjr/nS0gpdkdMQhYMYwr
 7uDykXm2vnkxnv+78IOmj/UUqmX3ue+9XX62DAZ64Xpu+NOVDxdfrt/0n/rZ5+uqKVwk
 JlDrzcU9AvRbucbKLnvRqtKwkvgce4Ltauy+jsiwBZuZOqsv/a1ATi7LbLYW1WZAqYLf
 H/uR9OMzNlKS44/7mX3Nzwy6dOTs0aksT6mUpqebDo00jgI4Zy4XqrsMJ/VzlUrUVvff
 GDGflQNR9wYD8/M2uuvO3PqDC7eh6Hy0gyvhnOGNpPVb4yjoUGyWtuyuHQeAb2ew95/O
 H2/Q==
X-Gm-Message-State: ANhLgQ2DDucen2XzOkOxgXO4qlds3yE0lSqo45CyLfqOdRHxOBULKcf2
 t3rzTCoHwa8x19jWIzh7YokYyQ==
X-Google-Smtp-Source: ADFU+vvv/SdiK193qk9z5f3vszFeLsiQsT7T5jDNl8mWNhMexutFUUvz+Cb8aAOQpTphRXmZE3cWSg==
X-Received: by 2002:a17:902:a603:: with SMTP id
 u3mr2380719plq.105.1584512313352; 
 Tue, 17 Mar 2020 23:18:33 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-11e1-e7cb-3c10-05d6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:11e1:e7cb:3c10:5d6])
 by smtp.gmail.com with ESMTPSA id d7sm5253614pfa.106.2020.03.17.23.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 23:18:31 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 4/5] selftests/powerpc: Add NX-GZIP engine decompress
 testcase
In-Reply-To: <20200316180714.18631-5-rzinsly@linux.ibm.com>
References: <20200316180714.18631-1-rzinsly@linux.ibm.com>
 <20200316180714.18631-5-rzinsly@linux.ibm.com>
Date: Wed, 18 Mar 2020 17:18:27 +1100
Message-ID: <877dzinq30.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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
Cc: abali@us.ibm.com, haren@linux.ibm.com, herbert@gondor.apana.org.au,
 Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain

Raphael Moreira Zinsly <rzinsly@linux.ibm.com> writes:

> Include a decompression testcase for the powerpc NX-GZIP
> engine.

I compiled gzip with the AFL++ fuzzer and generated a corpus of tests to
run against this decompressor. I also fuzzed the decompressor
directly. I found a few issues. I _think_ they're just in the userspace
but I'm a bit too early in the process to know.

I realise this is self-test code but:
a) it stops me testing more deeply, and
b) it looks like some of this code is shared with https://github.com/libnxz/power-gzip/

The issues I've found are:

1) In the ERR_NX_DATA_LENGTH case, the decompressor doesn't check that
   you're making forward progress, so you can provoke it into an
   infinite loop.

Here's an _extremely_ ugly fix:

diff --git a/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c b/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
index 653de92698cc..236a1f567656 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
+++ b/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
@@ -343,6 +343,8 @@ int decompress_file(int argc, char **argv, void *devhandle)
        nx_dde_t dde_out[6] __attribute__((aligned (128)));
        int pgfault_retries;
 
+       int last_first_used = 0;
+
        /* when using mmap'ed files */
        off_t input_file_offset;
 
@@ -642,6 +644,11 @@ int decompress_file(int argc, char **argv, void *devhandle)
        first_used = fifo_used_first_bytes(cur_in, used_in, fifo_in_len);
        last_used = fifo_used_last_bytes(cur_in, used_in, fifo_in_len);
 
+       if (first_used > 0 && last_first_used > 0) {
+               assert(first_used != last_first_used);
+       }
+       last_first_used = first_used;
+
        if (first_used > 0)
                nx_append_dde(ddl_in, fifo_in + cur_in, first_used);
 

2) It looks like you can provoke an out-of-bounds write. I've seen both
infinte loops printing something that seems to come from the file
content like:

57201: Got signal 11 si_code 3, si_addr 0xcacacacacacacac8

or a less bizzare address like

19285: Got signal 11 si_code 1, si_addr 0x7fffcf1b0000

Depending on the build I've also seen the stack smasher protection fire.

I don't understand the code well enough to figure out how this comes to
be just yet.

I've included a few test cases as attachments. I've preconverted them
with xxd to avoid anything that might flag suspicious gzip files!
Decompress them then use `xxd -r attachment testcase.gz` to convert them
back.

Regards,
Daniel


--=-=-=
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=infloop.bz2
Content-Transfer-Encoding: base64

QlpoOTFBWSZTWdzNDtIAAAxZAA4QQAFh0DUAoABUU0yMTADSep6mgGQncFomex2bYb1N7aOHRvWa
jSBCBgvSyHjdHbngu5IpwoSG5mh2kA==
--=-=-=
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=sig1.bz2
Content-Transfer-Encoding: base64

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
W0LaFtC2hbQtoW0LbDOc5znN3d3d3fPPPPPPOjeULaFtC2hbQtoW0LaFtC2hbQtoW0LaFtC2wznO
c5zd3d3d3ve973vfeTeULaFtC2hbQtoW0LaFtC2hbQtoW0LaFtC2wznOc5zd3d3d3ve973vfeTeU
LaFtC2hbQtoW0LaFtC2hbQtoW0LaFtC2wznOc5zd3d3d3ve973vfeTeULaFtC2hbQtoW0LaFtC2h
bQtoW0LaFtC2wznOc5zd3d3d3ve973vfeTeULaFtC2hbQtoW0LaFtC2hbQtoW0LaFtkn5+ee++++
+1VVW222uAAAAA87u7uqqqttttcAAAAF+fnnvvvvvvtVVW222uAAAAA+e+++++1VVfffffffXAAA
AAed3d3bVVVtttrgAAAAPO7u7qqqrbbbXAAAAAed3d3VVVW222uAAAAA87u7uqqqttttcAAfz+fg
AHXXUVVVVZmZmZmYkkknoAAAAAAACKFV9fX19b3ve972AACqqqqlVVVVAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAFVVVVX7zMzMzMzMzMwAAAAAAAAAAAAAAAAAAG86666666666664zMzM2222/m2232uA
AAAA87u79dVVVbbba4AAADx4P4e+++++1VVfffffffXAAAAAed3d3bbaqttttcAAAAB53d3dVVVb
bba4AAAADzu7u6qqq2221wAAAAHnd3d1VVVtttrgAAAAPO7u7qqqrbbbXAAAAAed3d3VVVW222uA
AAAA87u7uqqqttttcAAAAB53d3dVVVbbba4AAAADzu7u6qqq2221wAAePAAed3d3VVVW222uAAAA
A47u7qqqrfffffX6AAAAA8u7u6qqq2221wAAAAe+efn55777777VVNtJJJPQFT10AAAAABT/PXq7
u7ptttkgAAAAAAAAAAAAAAAAAAAAAAACqqqqoABVVVVUAAAFVVrWta1pVVe8AALAAAAAAAAAAAAA
AAAAAD1b66666666666664H5AD3vMzM2uAAAAA87u7uqqqttttcAAAAB53d3dVVVbbba4AAAADzu
7u6qqq2221wAAAAHnd3d1VVVtttrgAAAAPO7u7qqqrbbbXAAAAAed3d3VVVW222uAAAAA87u7uqq
qttttcAAAAB53d3dVVVbbba4AAAADzu7u6qqq2221wAAAAHnd3d1VVVtttrgAAAAP6O7v6d1VVVt
t99foAAAADz9fr9XdVVVbbba4AAAADzu7u6qqq2221wAAAe/4fn4B5777777VVVbbba4AAAAP4/P
z9Pffffaq/tVfffbbXePAAAAAAB+V1VV+1TbbbZJJJJJJJJJIAAAAAAVVVVVAAAAAAAAAAAAKqqq
qgAAAAAAAAAVVVVVe8zMzMzMzMKqqqrAAAAAAAAAAAAAAAAD4+dugAefffffffffffx/b77+bbbb
XAAAAAed3d3VVVW222uAAAAA87u7uqqqttttcAAAAB53d3dVVVbbba4AAAADzu7u6qqq2221wAAA
AHnd3d1VVVtttrgAAAAPO7u7qqqrbbbXAAAAAed3d3VVVW222uAAAAA87u7uqqqttttcAAAAB53d
3dVVVbbba4AAAADzu7u6qqq2221wAAAAHnd3d1VVVtttrgAAAAPO7u7qqqrbbbXAAAAAed3d3VVV
W222uAAAD+Pz8A8999999qr+1VtttrgAAAA7+evUXd3dttvzjbSSST0AAAAAAABQqvr6+vre973v
ewAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACqqqqr3mZmZmZmZmZgAAAKqqqqgAAAAAAAAAAA
H1t111111111111wDvvvvvvvvv5ttttcAAAAB53d3dVVVbbba4AAAADzu7u6rbbb7777776vQAAD
x4A/HvvvvvtVVX3333331wAAAAHnd3d22qqttttcAAAAB53d3dVVVbbba4AAAADzu7u6qqq2221w
AAAAHnd3d1VVVtttrgAAAAPO7u7qqqrbbbXAAAAAed3d3VVVW222uAAAAA87u7uqqqttttcAAAAB
53d3dVVVbbba4PHgAAAPO7u7qqqrbbbXAAAAB7+fnnvvvvvtVVVtttrgAAAAPO7u7qqqrbbbXAAA
AB/Xz8/PPfffffaquNtJJJPQAAAAAAAHr583+b3vdbbbfOMkAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAFVVVVS1rWtff39/f39/bXvAZmZmZmYAAAAAAAAAAAAAAAAAAG3XXXXXXXXXXXXAAB73mZmZ
rgAAAAPO7u7qqqrbbbXAAAAAed3d3VVVW222uAAAAA87u7uqqqttttcAAAAB53d3dVVVbbba4AAA
AD9vfffffaqqvvvvvvvrgAAAAPXvvvvvu22219999999cAAAAB/D333333bbba+++++++uAAAAA8
7u7u22qq2221wAAAAHnd3d1VVVtttrgAAAAPO7u7qqqrbbbXAAAAAed3d3VVVW222uAAAAPfz8PP
fffffaqqrbbbXAAAAAed3d3VVVW222uAAAD+vn5+fv8/A8/f7/f7/f7qq+q2221wAAAAf5+fn557
77777VVfVtttrgAAAAAAA9fL9Xd3q22342SSSSSSSSQAAAAAAAAAAAAqqqqqAAAAAAAAAAAAAAAA
AAAVVVVVe8zMzABVVgAAAAAAAAAAAAAAAAA38AB599999999999999/NtttrgAAAAPO7u7qqqrbb
bXAAAAAed3d3VVVW222uAAAAA87u7uqqqttttcAAAAB53d3dVVVb77777XAAAAAefnd3dVVVbbba
4AAAADzu7u6qqq2221wAAAAHnd3d1VVVtttrgAAAAPO7u7qqqrbbbXAAAAAed3d3VVVW222uAAAA
A87u7uqqqttttcAAAAB53d3dVVVbbba4AAAADzu7u6qqq2221wAAAAHnd3d1VVVtttrgAAA/r+fg
HnvvvvvtVX+lW222uAAAAAO5v16u7u7bbbLbSSSTmI6qqqq902229gAAAAAAAAAAAAAAAAAAAAAA
AAAABVVVVUAAAqqqqqAVVVVVe8zMzMzMzMzMAAAAAAAVVVVVAAAAAAAAA/He+eQD+H6D3vMzMzN8
8cfXrzznOc5zlVVUqq22325znOc5VVV3ve97222AAFVWpVVttgACqqqVVbbYAAqqqlVW22AAKqqp
VVttgACqqqVVbbYAAqqqlVW22AAKqqpVVvPPPt65znOc5VVdpVVttgACqqqVVbbb6gAVVVXVVbbY
AAqqqlVW22AAKqqpVVttgACqqqVVbzb49+/fv379+6t71vYAAAAAAAAAAAAAAAAAAAAAAAAACqqq
qoAAAAAAAAVVVVVe8zMzMzMzMzMAAAAAAAAAAAAAAAAAADfHPzz1+QAaPewd7bbAACtVUqq22wAB
VVVKqttsAAVVVSqrbbAAFVVUqq22wABVVVKqttsAAVVVSqrbbAAFVSve973va225znOc5VV+KlVW
22AAKqqpVVttgACqqqVVbbYAAqqqlVW22AAKqqpVVttgACqqqVVbbYAAqqq3ve973uyTn/skkkkk
lxJJJJP5/PX0z169evXr/H379+/fv37/Ekkk5iPLu7u7ttv42ySSSSSSAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAqqqqq/nMzMzMzMzMzAAAAAqqqqqAAAAAAAAAAAklzJJJJJJJJxpJJJxERrWta
1pttt1KqttsAAVVVSqrbbAAFVVUqq22wABVVVKqttsAAVVVSqrbbAAFVVUqq22wABVVVKqttsAAV
VVSqrbbAAFVVUqq22wABVVVKqttsAAVVVSqrbbAAFVVUqq22wABVVVKqttsAAVVVSqreeeXx9Pfv
379+7ttt8baSSScxG6831ve972238bJJJJJFVVVVQAAAAAAAAAAAAAAAAKqqqrSqqqqAAAAAAAAA
ABVVVVV7zMzMzMzMzMwAAAAAAAAAAAAAAAAACSSXMkkkkkkknGkkknERGta1rWm23VSqrbbAAFVV
Uqq22wABVVVKqttsAAVVVSqrbbAAFVVUqq22wABVVVKqttsAAVVVS973rbbB+QBVVVKqttsAAVVV
SqrbbAAFVVUqq22wABVVVKqttsAAVVVSqrbbAAFVU20kkk4ifBEVVVVU238bbaSSSczPd9Xd3d22
22W2kkknMR+1VeqqqbbbbJJJAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKqqqqveZmZmZmZmZ
mAAAAAAAAAAAKqqqqgAAAAb55AAHveZmZmb44448888888qqqlVW22AAKqqpVVttgD6/Wqqq73vZ
fpbbAH/QqqqlVW22AAKqqpVVttgACqqqVVbbYAAqqqlVW22AAKqqpVVttvqegAqqqnve97REQ9a1
rWm2222ykkk4mf8iKqqqqzMzMzPn5VVbbYAAqqqlVW22AAG22220kkk4ie/nU/nXV3d3q2235xtp
JLvdknqJIkkkkZznOc5zd3d387u973ve916655369evXr169fW973tsAqqqqqAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAKqqqqv3mZmZmZmZmZgAAAAAAAAAAAAAAAAAAb55ADve978yqrbbAAFVVUq
q22wABVVVKqt5558euc5znOVV96u973vS3Ez/B8G973ve8zMzOZmJJJJxER3VVVVTbqq73ve97bb
egAFVarve971ttgACqqqVVbbb8c5znOcqqq73ve979vLbbnOc5zitX4qVVbbYAAqqqlVW22AAKqq
pVVt558/H03v37u7vMzMzmZiSSSc9iYmqqqqm22+NtJJd7p6zGMmTMzMkkJJJJGZMyY78fHx8fHx
bbb42ySSS4nuBMQIj86qqr9qk22+NtJJJOYjvut763ve9tttkkkkkkkkkkkkgAAAVVVVVAAAAAAA
AAAAqqqqqAAAAAAAAAAAAAFVVVVX7zMzMzMzMzMwAACqqqqoAAAAAAAAAAAADfHx1zw73ve973ve
9/HfmVVbbYAAqqqlVW22AAKqqpVVttgACqqbaSSSczPwVVVVU22/G20kkk5mfkDu7u7u223xtkkk
lxM/yBFVVVVNttvMxJJJOJnB5Iu7u7vMzM8zMxJJJOIiNa1rWtN1VUqq22wABVVVKqt5558eqqqq
qbbfjbaSSSczPwVVVVU22/G20l3ve6k/WfhJBEe+BJJPrgQhP6yREQPvgkJJ9MgiEe2SSSQT84iS
JI9sgIkPMggJ7YgSSPjCCREe+RJEJ9skIQ9YSITEXvzzv35e8zCeY8xJJJZEYJgSJAAExMzEzMzM
zAEevJ9e7u71eZmZ5mZhJSSzJmfJF3d3d5mZnmZmJJJJxM4OR5PXnffffffeZmcw57Ab544/W/Xr
169evXre973bAAAAAAAAAAAAAAAAAAAAAqqqqqAAAAAAAAAAAAAD91VVVVnGAAAAAAAAAAAAAAAA
AAAAAb5575znOc5znOc4sZJJJcREa1rWtaTbbbbSSS22wABVVVKqttsAAVVVSqrbbAAFVVUqq22w
ABVVVKqt5558b1znOc5yqvvVKqttsAAVVVSqrbzHreegAKqqpVVttgACqqqVVbbbvOc5znKqqu97
3ve22wAAtVVKqttsAAVVVSqrbbPOc5znKqqu9JJLiJ7ERu7u7u022zpskklzM//F3JFOFCQ0zoI7
QA==
--=-=-=
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=sig676767.bz2
Content-Transfer-Encoding: base64

QlpoOTFBWSZTWWZd5rsAHdFfgH/0RAF/9AgAAhI/sMZoYAlfAAe4B6A24osqtRtSqqgW18YAGjQ0
YRk0GjTQGJPU0/UflR7ftVUppoA0GTQwQVT2pNqbyN6k0iqf6oBMgZBphEfpKZTZNpNNVJgjQaGg
MGNA0MJoNGmmmjQA0aCJTJKbRPJPUieBTag9T1NGmTfB5E4ERDiAqsMGABXBgwhiOIw+UDEeJcJI
R4EVeUFeIgVFDugqHOABvFXeNQMxR2gOIItxeUFQuCGkVTeKvWKu3fsUp39KUVYIBBUIgDAYqixV
inV8js+MPmoKnlDAyCAj9NBFU/n6Z+MfrPM9I+/Tp7EMxNYKiMi3EER2gAI8oSGm+BVBqCAjIACM
iKg3gAEcQgSEkiyISFzSf1tj1P325T415agAoHWK6xRVOySKiHWIKNVghBUUxMQVFIAKkOXdwiiP
zEzBVVPrARUr35fX1v2nfERU2/GPbmds8RQQZx20Cgg+4oIPF/Fyq8e3y8PLw89dZNfT09Ovrvvv
vv1NttttsYxjGMYzm973vSmMRCSGCqSAAAr7HdwG4c2OG/Q9B6+Xl455+fj0cTiAAVVVVVFVVVVQ
AAAAAFVVVVQAAVa1rW+++++7WtKoADhwAAAAADbbbbbYAAKqrWta1rSqqAAAAAAAAAAFVVVVQqqq
qqAAAAAKqqqqgERERERDMzMzMzN6xje+8VvZCmEaPVd7NDQ+MRCAACqqqqoVVVVVAAAAAAAAAAAA
AAFVVVVQAAAAAAAAAAAAAZznOc5znIAAAAACqqqqoAAYxjGMYxgAAAqqqoiK9dZAA7SQHKSb2pfN
3kze/xUpHqIiN2tadW5551zEREFwAAACIve972mnjmpPM+aU8LVkznObALu7sXSGc5zavKZznNgF
3d2AXd3YBVXdgGLu7ALu7tXaZznNgF3d2rJd3dgF3d2AXd3YHZFzl7p3zTOa7L809V8eLbWtrjWj
SqtarrU60AapyAAAAGc9OnTp0004Xff5d1q3Jd3dzwiuM5zdBBe+ZrObX5xC85zYBVVQBVVQBVVQ
BVVStSVVAFVVAFVVAGKqgDFVQBVVSu/Gm1rW28Up0u29uul66yqrWqv1110AHQAAAAZze973pTUp
R52pSlDsxN3Uts02jjjgAAC7dO7gAAVZklCSAmDExvId3cPPMeYt3zytarog0AHIAAAARze9733t
WYhETjbbZAAAAYAAAAAADpJVefPPFJ0bsM5y2cwq04zAQ7u7zAIAAAETe9733tWYgAC6SwkvLO7q
7u4ACSQAAHCSA5AggG0QEFbu+MY446cbc99dTXXjfrxxvvvvHkRERERERERnV73vfik9Zz47u4Ds
kqpJ2SrN5B7oKiNQEEdYPOAIjIICN74BUEddddVUERqq61VYxi6qudVWMYqsVoVirEFFTM59IKgi
POPhrrrrt31XLTmn44pxxMwO7u+uagAAO74jTMzNvauZiEACqSqkgPTSlJmk0mkklZ3faSAASSRE
REREX1SVta3mlZvMzOeFoqxMkABpyoBEREREZ1e9734pPWc8JIADzp3cB0lxJJOztNndwKJIAmQJ
TCwlbQ+tetY1nnluedah5ADUxERERERERGWZmaLVeYREREREREREAAAAAAAAA7/ebNJmkzS/DdP6
/v3VuZ6T1jCecbd99999vxxRl7O++wA/QAAAAIZma3dJ9Y1l0kA6SA9ySdJAcpIAB0kBVEqicV22
T1KebTMzIq0VZmJyAGgAAAIjNrWtbuk8ayBVJAeQ7uBykgAAAARERESqI+V8777SnneVlZFWirM5
l3d31IABWIiIjNrWtbuk8ayAB4kgEkgANJIAB0kAAB8NjuFapb3ve9xzy3re973jGMY1TGMxERHq
IiIza1rd8TxrKEphVJAVSUwmAAAAAAAG8+uH4650/Fe85tWrV13nPfXWsZjx74tEPEcREWiIza3P
bzxnQAAAAGUkAB9UkAABykgPl+W9tSlN66rxTje673rnn2Tt5PWegd8vjGMYxjLvkM3ve94s8wlU
REqiIiW8UoqnbAAR7IId0VAEDTTT9C4iKLJnd0khgdJYSXSSAokiZ82ZpZnJmlKTS8YKKP2gqg/5
99ftxpT/0K++P/6YT8dmFVB3cOMmRKXcs/F3JFOFCQZl3muw
--=-=-=
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=sigededed.bz2
Content-Transfer-Encoding: base64

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
qmZiIwAde3p6IG28RF4iG234fHHEzPVTnihbQtoW0LaFtC2hbQtsk5znz58+/Hv3z58+c5ve973v
e973ve973vewABmZmZmZmYAAfvMzM95mZmACqqqqoAAAAAAAAAAAAAAAAGZmZmZmZgAAAAABVVVV
UAACqqqqoAAHv379+/YAAAAAAAP/nXnlC2hbQtoW0LbJMy2w8+fO+/Oduc5znOc/j9661rXdPecw
MtC2hbQtoW0LaFtC2hbQtoW0LaFtC2hbYc5znfWu2ta5znOc/ffv31119yc8ULaFtC2hbQtoW0La
FtC2hbQtoW0LaFtC2w5znO+tdta1znOc5++/fvrrr7k54oW0LaFtC2hbQtoW0LaFtC2hbQtoW0La
FthznOd9a7a1rnOc5z99+/fXXX3JzxQtoW0LaFtC2hbQtoW0LaFtC2hbQtoW0LbDnOc76121rXOc
5zn779++uuvuTnihbQtoW0LaFtC2hbQtoW0LaFtC2hbQtoW2HOc531rtrWuc5znP33799ddfcnPF
C2hbQtoW0LaFtC2hbQtoW0LaFtC2hbZJrO3aw5znNffV7dddc585zn77961rvJz7oW0LaFtC2hbQ
toW0LaFtC2hbQtoW0fHz8/Px8fHx8/Pz8VV97zm7tVXrvd3bwAAAAD/fv379+/vec3d9+/fv3799
7u778AAAA/v5+Qqr+ff59fX5+flX7X5+ZmXgAAAAFXr15nOZmevXqq73d28AAAAAqrzOczMqqu93
dvAAAAAKq8znMzL169evX5+ZmV9gAAAAVV5vObu35VXe7u3gAAAfPz8gVV5nOZmVVXe7u3gAB7+f
kAA9+/fv35vObu+/fv379++93dvAA6666668883vevvXnlXngAAAAAGZmZmZmZgABfGta1rWta1r
TYAAAAAAAAAAAAAAAAAAAAZmZmZmZmAAAAAAre973ve973tX95znOc5znOc5znAAAAAA9+/fv37A
AAAAAAVeOuuuuuugf1/X9fz+efvOfv7+/v769evd3u7t4AAAABVXmc5mZVVd7u7eAAAAAVV/n3n1
9ZlVV+fnd28AAAAAqrzOczMqqu93dvAAAAAKq/fvfr63dqq/PzMy8AAAAAq9evM5zMz16qrvd3bw
AAAACqvM5zMyqq73d28AAAAAqrPvnMzKqr87u7eAAAAAVV5nOZmVVXe7u3gAAAAFVeZzmZlVV3u7
t4AB8PgAAVV5nOZmVVXe7u3gAAAAFVeZzmZlVV3u7t4AAAABVXfvfr63dqq/PzMy8AAAAA9ev39v
M+vrMz169equ93dvAAAAPv5+Q/arzec3dqqu93dvAAA+HwAPv/Xx/r4+BQqqA66bbfs99klttt5h
Jfu7+BQqqADtAIh27ZmZmZmZmduc9+/f5465z58+c5ve973sAAAAGZmZmZmZgAA7+ta+ta1rWtd6
0AAAAAAAACqqqqoAAAAAAAAAzMzMzMzMAAAAAAKqqqqv85znOc5znOc5znAAAAAA9+/fv37ACqqq
q2qqqqgPHXXXXXXXXXXXX39/de319AH+eb3mZ54AHwAAAqr7znMzKqrvd3fqAAAAAqr7znMzKqrv
d3fqAAAAAqr7znMzKqrvd3fqAAAAAqr7znMzKqrvd3fqAAAAAqr7znMzKqrvd3fqAAAAAqr7znMz
Kqrvd3fqAAAAAqr7znMzKqrvd3fqAAAAAqr+vX9755u1Vbv+f536gAAAAKvXr7znMzPVVXe7u/UA
AAABVX3nOZmVVXe7u/UAAAABVX3nOZmVVXe7u/UAAAABVX3nOZmVVXe7u/UAAAABVXr+t+vrd2qr
8/MzPqAAAD7/18/IFXr19/n59fX5+fnqqu/mZn1AAAAB/nz81evX3vObu+vXfXqu93d+o+/n5ddd
ddddddddeeeb3v+fzXnlXngAAAAAGZmZmZmZgABv+b3ve/e973vewAAFVVVVQAAAAAAAAAAAAAAD
MzMzMzMwKqqqqgKqqq3vaqqqv85znOc5znOc5znAAAAAA9+/fv37AAAAAAAC8666AH9f1/X8/n3+
85+/v7+/v7+/vu73d36gAAAAKq+85zMyqq73d36gAAAAKq+85zMyqq73d36gAAAAKq7/W/X1u7VV
+fmZn1AAAAAVevX3nOZmevXr1V3u7v1AAAABz4/vnKq+95zc2q/a73d36gP9/Hz8gAAB79+/fv73
nN3ffv379+/fe7u/UAAAABVX3nOZmVVXe7u/UAAAABVX3nOZmVVXe7u/UAAAABVX3nOZmVVXe7u/
UAAAABVX3nOZmVVXe7u/UAAAABVX3nOZmVVXe7u3gAAAAFVeZzmZlVV3u7t4AAAABVXmc5mZVVd7
u7eAAAAAVV5nOZmVVXe7u3gAAAAf58fPzVXm85u7V/Ku93dvAAArze96+9eeVeeAAAAAAZmZmZmZ
mAAGu/fvXxr1rWta/PzWgAAAAAAAAAAAAAAABVVVVUqqq7d/n5+fn5+BpvaqlVVVVAFVVVVX95zn
Oc5znOc5znAAAAAA9+/fv37AAAAAAAD48ddddddddddddff3938/fvnP39/f39/f399353d28AAA
AAqrzOczMqqu93dvAAAAAKq8znMzKqrvd3bwAAAACqvM5zMyqq73d28AAAAAqrzOczMqqu93dvAA
AAAKq8znMzKqrvd3bwAAAACqvM5zMyqq73d28AAAAAqrzOczMqqu93dvAAAAAKq/v7z6+syqq/Pz
O7eAAAAAVV5nOZmVVXe7u3gAAAAFVeZzmZlVV3u7t4AAAABVXmc5mZVVd7u7eHw+AAAAFVeZzmZl
VV3u7t4AHw+AAAVV5nOZmVVXe7u3gAAAf58/IFVebzm7tX8q73d28AAAADv+t+Ocqv683nN3a7Vd
7u7eAABV3vfz+vyv5/P56/n8qqqq8CqqqqpmZmZmZmYAAfVv63ve973vN7xAAAqqqqqAAAAAAAAA
AAAAAAZmZmZmZmAAAAAAFVVVve9/5wAOc5zgAAAAAe/fv379gAAAAAAB4666666666666+/v7r2+
voA/zzvd3bwAAAACqvM5zMyqq73d28AAAAAqrzOczMqqu93dvAAAAAKq8znMzKqrvd3bwA78fPyA
AAVX35nOZmVVXe7u3gAAAAFVeZzmZlVV3u7t4AH++uru7u7u7u7v111dyST8+F69LikkkS5zj93d
gAAACr168znMzPXqqu93dvAAAAAKq8znMzKqrvd3bwAAAACqvM5zMyqq73d28Ph8AAAAKq8znMzK
qrvd3bwAAAACqvM5zMyqq73d28AAAAD+/n5qrzec3dqv2u93dvAAAu7u7u7uDrq7kkns99kmSSSZ
hJfu7u7u7AAP8znA8+fmqvPznPz/Pyu/yrvd3bwD38/J8/PyAAGnz8+/fv378/Oc/Pz89+8kkzCS
/d3d3d3d3d3dtvMxfKb888b3d3dAAAAAzMzMzMzMAALPvX61rWv3rWtabAAAAAAAAAAAAAAAAAAA
ADMzMzM777CqqgAAACqqqqr+85znOc5znOc5zgAAAAA9evXr0ABVVVVUAAA8ddddddddddddff39
17fX0Af55veZl4AAAAf7+fk9+/fv35vObu+/fv379++93dvAAAAAKq8znMzKqrvd3bwAAAACqvM5
zMyqq73d28AAAAAqrzOczMqqu93dvAAAAAKq8znMzKqrvd3bwAAAACqvM5zMyqq73d28AAAAAvXr
1eZ9fWZlVV3u7t4AAAABeqvM5zMyqq73d28AAAAAqrzOczMqqu93dvAAAAAKq8znMzKqrvd3bwAA
AACqvM5zMyqq73d28AAAAAqrzOczMqqu93dvPh8AAAACqvM5zMyqq73d28AAAAAqrzOczMqqu93d
vAPh8AAAP8/p8c5VXn5zn5+flX8q73d28P8/Xz8ffXx555v97+/5rzyrzwABVVVVUA1rWta1rWta
0AAer671r9a1rX5rXemwqqqqqAAAAAAAAAAAAFVVVVQADMzMzMzMwAAAAAAqqqqq/vOc5znOc5zn
Oc4AAAAVVevXr16qqqAAAAAAPPn5/f7/e9nfe7u7u7HmElgANtvnO++c42228wksAQGZzmZgDvba
kkBmc5mYA722pJAfq37+7aBu5mJJPff3+2Z9/eZnvvod7bUkn7DM5zMwB3ttSSAzOczMAd7bUkgM
znMzAHe21JIDM5zMwB3tteeefx9At5y2h+zvbakkBmc5mYA722pJAZnOZmAO9tqSQGZzmZgDvbak
kBmc5mY999993czDzzz8z4Dvec73r9P1+ze8zPPj318/Pnnm971/NeeVeeAACqqqqoGta1rWta1r
WgAD9fx63+et739b973vW9lVVVAAAVVVVVAAAAKqqqraqqqqAAq3ve97/HffbMzMwAAAAAAqqqqq
/znOc5znOc5znOcAAAAAHr169egAAAAAAAefPz+/38Zm733u7u7ux5hJYADbb5zvvnONttvMJqSQ
GZzmZgDvbakkBmc5mYA722pJAfu37+7aBu5mJJB77mc5mZ76DvbakkBmc5mYA722pJAZnOZmAO9t
qSR776zPv7zMAd7bUkj0ZnOZmAO9tqSQHtv3920DdzMSSfoHu79/e7oLfz8/Ekge+285bfQbuZjz
zz/T6A/nectoG7mYwK+7AbbbS77STfjbS5zjqq+KAoVVAfxYQAkC9LCQhAvr5X303ve97bvdt73v
e/eZ1rvz5+PjnOb3vWtc5VzwAAAAADWta1rWta1rQABret9b3ve973vZAAAAAAAAAAAAAAAAAAAA
DMzMzMzMwK3ve973ve97UAAKqqqqv9Oc5znOc5znOc5wAAAABfX19PQAAAAAAAPPn5+/v7+97O+9
3d3djS5zjAAbbbJ77JLbbaXOcYAH+ZJJPtL16XtSSSJc+4AA223znffGW221uZiSQC3nLaBu5mJJ
ALectoG7mYkkAt5y2gbuZiSQDL9c5bQN/Pz8SSB77jnLaBu5mJJALectoG7mYkkAt5y2gbuZiSQC
3nLaBu5mJJAPd316STbbJ+/v7YqpYkkbS77STkkiXOcYFfn1IBu85u6fobuZjzzy/QG7zm7unnnm
td99+fH76+fnnOb3v71rnKueAAAAAAzMzMzMzMAAF9a1rWta1r81psAAAAAAAAAAAAAAAAAAAAd9
999999999gAAAAACqqqqr+85znOc5znOc5zgAAAAA9evXr0AAAAAAADz5r5+fn5zN3vvd3d3Y0uc
4wAG22ye+yS222tzMSSAW85bQN3MxJIBbzltA3czEkgFvOW0DdzMSSAd3fv73dBb+fn4kkD323nL
b7776buZiSQC3nLaBu5mJJALectoG7mYkkAt5y2gbuZiSQC3nLaBu5mPPPM+gN3nN3XQ3czE88/p
YkkkS77SUkkiXOcYADbbZPfZJbbb3czEkgFvOW0DdzMeeefn7/jh9jve3b37985vnOddevXrj7yT
nOc+fPn57985ve+b3ve973ve9gAAAZmZmZmZmAAB9a1rWta1r81rQAAAAAAAAAAAAAAAAAAAAZmZ
mZmZmVve973ve972oAAAqqqqq/vOc5znOc5znOc4AAAAAPXr169AAAAAAA3ve975J48ePHve7ve9
73vf8c661rWuBznOc1q61rQG7bakkB/FvL92gbtzEkgMz5i0DdttSSAt+W2gbttqSQFvy20DdttS
SAt+W2gbttqSQFvy20DdttSSAlttoFttqSQFvy20DdttSSAt+W2gbttqSQHu7zd3QW5nOOqrBbbb
S6SSeNtpEksVX6FiSSJdJJSSSJEksCt+l2A37bzOszMeNtpEktJaSASElzYSEhLpYBJIASJskhKS
SO2SQhEfXOc78/fnzt8+e/nN75zWvXr1648s+fnzzzy/flXgeAAAAAAZmZmZmZmAAD8/WZ9ZmZmZ
3gAAAAAAAAAAAAAAAAAAAqqu+++2ZmZmKqqqqgCqqqq2qqqqv7znOc5znOc5znOAAAAAD169evQA
AAAAAALz4+uvn4/n8/n8vt+t3d3fNjSJJYrlig229+sz1mZ8N62TznGJIHuZ8zM9999G7ba888z6
Bu/N3dP0N221JIC35baBu22vPPLPo99bvaSTxttIkliq/VoXI5OZneesyZJIkecSSA/lmcxQLczN
SSAt+W2gbttqSQFvy20DdttSSD1by20DdtteeTPryD235bb6fod7u7qCuCxLVySZnWZmSZskzEkn
Q4LsWKuxYsNtk9Ektvxt5iSTA4Lq6u7q7ugAKoJDsyISIdYQiAZkREI1gqhVUBQr8sCgKoV7EvwX
Pcm71u+bPzN/JMxJJgDlioLnfXUkS6SSknkkzEknQDb0V5VeVVVcAAAAMzMzMzMzAAB+fmZ9fWZm
ZmYAAAAAAAAAAAAAAAAAAACqu+++++2ZmYAAAAAAKqqqqv7znOc5znOc5znOAAAAAD169evQAAAA
AAAPPn4/XXx9/f3s/QD9fv/V3u7upJAzPmZmAO93d1JIGZ8zMwB3u7upJA/dvLbQN22155Xgttsn
oklvG28xJJiq/ViSQnokmSSSZiSTFVLEkhPRJMkkkzEknVUauSSJdJJSeSSZiSUqqNttk9Ekt423
mJJMVUsSSfiXaSUkkiRJLFVLEkZPRJLckkzEknVUbbbJ6JJbxtvMSSdVREkhCfWJJCJNZERHMkEJ
HWII3iSISfmREkhGYSSQQ75EkkkPrAhE5kCR3wkkk3kIRmSJJEnvBEQXCQJO2CET1Bz5nx9b1vnm
zzz8/JMxJJy7F2ALuxd1V2AAKFACqAu/jqSQ/HRJMkkkzEkpAKS6HdiSTM6zMyTdkmYkk6qvvs/d
+m2/PPO/PF435555rWZmefPx8eeeVVXA4AAAAABmZmZmZmYAAP58a1rWta1rWtCqAAAAAAAAAAAA
AAAAAAAHffffffffffYAAAAAA/tb3ve973ve+crgAAAAAAA9evXr0AAAAAAAD78+fn6+vrN3rd3T
u7seYkk6A/V1UkhPRJMkkk73d3UkgZnzMzAHe7u6kkD8z5mZgDe7u68nz688ge28twC3MxEkg9/M
+ZmZ6Bvd3dSefPqQMz5mfmAO93d1JIGZ8zMwB3u7up5P5fXkv0D+e83d10N221JIPfzPr5mZgDtt
qSQe/j5mZgDvd3dSSBmfMzMAeYkkwAG2+c65znG223mJJMVUsSSE9EkySSTMSSYFEXXLbb8zO8zM
b1/jSJMdhL829fb7N+bdfH/F3JFOFCQFNIyHAA==
--=-=-=
Content-Type: text/plain



>
> Signed-off-by: Bulent Abali <abali@us.ibm.com>
> Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
> ---
>  .../selftests/powerpc/nx-gzip/Makefile        |    7 +-
>  .../selftests/powerpc/nx-gzip/gunz_test.c     | 1058 +++++++++++++++++
>  2 files changed, 1062 insertions(+), 3 deletions(-)
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
>
> diff --git a/tools/testing/selftests/powerpc/nx-gzip/Makefile b/tools/testing/selftests/powerpc/nx-gzip/Makefile
> index ab903f63bbbd..82abc19a49a0 100644
> --- a/tools/testing/selftests/powerpc/nx-gzip/Makefile
> +++ b/tools/testing/selftests/powerpc/nx-gzip/Makefile
> @@ -1,9 +1,9 @@
>  CC = gcc
>  CFLAGS = -O3
>  INC = ./inc
> -SRC = gzfht_test.c
> +SRC = gzfht_test.c gunz_test.c
>  OBJ = $(SRC:.c=.o)
> -TESTS = gzfht_test
> +TESTS = gzfht_test gunz_test
>  EXTRA_SOURCES = gzip_vas.c
>  
>  all:	$(TESTS)
> @@ -16,6 +16,7 @@ $(TESTS): $(OBJ)
>  
>  run_tests: $(TESTS)
>  	./gzfht_test gzip_vas.c
> +	./gunz_test gzip_vas.c.nx.gz
>  
>  clean:
> -	rm -f $(TESTS) *.o *~ *.gz
> +	rm -f $(TESTS) *.o *~ *.gz *.gunzip
> diff --git a/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c b/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
> new file mode 100644
> index 000000000000..653de92698cc
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
> @@ -0,0 +1,1058 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * P9 gunzip sample code for demonstrating the P9 NX hardware
> + * interface.  Not intended for productive uses or for performance or
> + * compression ratio measurements.  Note also that /dev/crypto/gzip,
> + * VAS and skiboot support are required
> + *
> + * Copyright 2020 IBM Corp.
> + *
> + * Author: Bulent Abali <abali@us.ibm.com>
> + *
> + * https://github.com/libnxz/power-gzip for zlib api and other utils
> + * Definitions of acronyms used here.  See
> + * P9 NX Gzip Accelerator User's Manual for details
> + *
> + * adler/crc: 32 bit checksums appended to stream tail
> + * ce:       completion extension
> + * cpb:      coprocessor parameter block (metadata)
> + * crb:      coprocessor request block (command)
> + * csb:      coprocessor status block (status)
> + * dht:      dynamic huffman table
> + * dde:      data descriptor element (address, length)
> + * ddl:      list of ddes
> + * dh/fh:    dynamic and fixed huffman types
> + * fc:       coprocessor function code
> + * histlen:  history/dictionary length
> + * history:  sliding window of up to 32KB of data
> + * lzcount:  Deflate LZ symbol counts
> + * rembytecnt: remaining byte count
> + * sfbt:     source final block type; last block's type during decomp
> + * spbc:     source processed byte count
> + * subc:     source unprocessed bit count
> + * tebc:     target ending bit count; valid bits in the last byte
> + * tpbc:     target processed byte count
> + * vas:      virtual accelerator switch; the user mode interface
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <stdint.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/time.h>
> +#include <sys/fcntl.h>
> +#include <sys/mman.h>
> +#include <endian.h>
> +#include <bits/endian.h>
> +#include <sys/ioctl.h>
> +#include <assert.h>
> +#include <errno.h>
> +#include <signal.h>
> +#include "nxu.h"
> +#include "nx.h"
> +
> +int nx_dbg = 0;
> +FILE *nx_gzip_log = NULL;
> +
> +#define NX_MIN(X, Y) (((X) < (Y))?(X):(Y))
> +#define NX_MAX(X, Y) (((X) > (Y))?(X):(Y))
> +
> +#define mb()     asm volatile("sync" ::: "memory")
> +#define rmb()    asm volatile("lwsync" ::: "memory")
> +#define wmb()    rmb()
> +
> +const int fifo_in_len = 1<<24;
> +const int fifo_out_len = 1<<24;
> +const int page_sz = 1<<16;
> +const int line_sz = 1<<7;
> +const int window_max = 1<<15;
> +const int retry_max = 50;
> +
> +extern void *nx_fault_storage_address;
> +extern void *nx_function_begin(int function, int pri);
> +extern int nx_function_end(void *handle);
> +
> +/*
> + * Fault in pages prior to NX job submission.  wr=1 may be required to
> + * touch writeable pages.  System zero pages do not fault-in the page as
> + * intended.  Typically set wr=1 for NX target pages and set wr=0 for
> + * NX source pages.
> + */
> +static int nx_touch_pages(void *buf, long buf_len, long page_len, int wr)
> +{
> +	char *begin = buf;
> +	char *end = (char *) buf + buf_len - 1;
> +	volatile char t;
> +
> +	assert(buf_len >= 0 && !!buf);
> +
> +	NXPRT(fprintf(stderr, "touch %p %p len 0x%lx wr=%d\n", buf,
> +			buf + buf_len, buf_len, wr));
> +
> +	if (buf_len <= 0 || buf == NULL)
> +		return -1;
> +
> +	do {
> +		t = *begin;
> +		if (wr)
> +			*begin = t;
> +		begin = begin + page_len;
> +	} while (begin < end);
> +
> +	/* When buf_sz is small or buf tail is in another page. */
> +	t = *end;
> +	if (wr)
> +		*end = t;
> +
> +	return 0;
> +}
> +
> +void sigsegv_handler(int sig, siginfo_t *info, void *ctx)
> +{
> +	fprintf(stderr, "%d: Got signal %d si_code %d, si_addr %p\n", getpid(),
> +	       sig, info->si_code, info->si_addr);
> +
> +	nx_fault_storage_address = info->si_addr;
> +}
> +
> +/*
> + * Adds an (address, len) pair to the list of ddes (ddl) and updates
> + * the base dde.  ddl[0] is the only dde in a direct dde which
> + * contains a single (addr,len) pair.  For more pairs, ddl[0] becomes
> + * the indirect (base) dde that points to a list of direct ddes.
> + * See Section 6.4 of the NX-gzip user manual for DDE description.
> + * Addr=NULL, len=0 clears the ddl[0].  Returns the total number of
> + * bytes in ddl.  Caller is responsible for allocting the array of
> + * nx_dde_t *ddl.  If N addresses are required in the scatter-gather
> + * list, the ddl array must have N+1 entries minimum.
> + */
> +static inline uint32_t nx_append_dde(nx_dde_t *ddl, void *addr, uint32_t len)
> +{
> +	uint32_t ddecnt;
> +	uint32_t bytes;
> +
> +	if (addr == NULL && len == 0) {
> +		clearp_dde(ddl);
> +		return 0;
> +	}
> +
> +	NXPRT(fprintf(stderr, "%d: nx_append_dde addr %p len %x\n", __LINE__,
> +			addr, len));
> +
> +	/* Number of ddes in the dde list ; == 0 when it is a direct dde */
> +	ddecnt = getpnn(ddl, dde_count);
> +	bytes = getp32(ddl, ddebc);
> +
> +	if (ddecnt == 0 && bytes == 0) {
> +		/* First dde is unused; make it a direct dde */
> +		bytes = len;
> +		putp32(ddl, ddebc, bytes);
> +		putp64(ddl, ddead, (uint64_t) addr);
> +	} else if (ddecnt == 0) {
> +		/* Converting direct to indirect dde
> +		 * ddl[0] becomes head dde of ddl
> +		 * copy direct to indirect first.
> +		 */
> +		ddl[1] = ddl[0];
> +
> +		/* Add the new dde next */
> +		clear_dde(ddl[2]);
> +		put32(ddl[2], ddebc, len);
> +		put64(ddl[2], ddead, (uint64_t) addr);
> +
> +		/* Ddl head points to 2 direct ddes */
> +		ddecnt = 2;
> +		putpnn(ddl, dde_count, ddecnt);
> +		bytes = bytes + len;
> +		putp32(ddl, ddebc, bytes);
> +		/* Pointer to the first direct dde */
> +		putp64(ddl, ddead, (uint64_t) &ddl[1]);
> +	} else {
> +		/* Append a dde to an existing indirect ddl */
> +		++ddecnt;
> +		clear_dde(ddl[ddecnt]);
> +		put64(ddl[ddecnt], ddead, (uint64_t) addr);
> +		put32(ddl[ddecnt], ddebc, len);
> +
> +		putpnn(ddl, dde_count, ddecnt);
> +		bytes = bytes + len;
> +		putp32(ddl, ddebc, bytes); /* byte sum of all dde */
> +	}
> +	return bytes;
> +}
> +
> +/*
> + * Touch specified number of pages represented in number bytes
> + * beginning from the first buffer in a dde list.
> + * Do not touch the pages past buf_sz-th byte's page.
> + *
> + * Set buf_sz = 0 to touch all pages described by the ddep.
> + */
> +static int nx_touch_pages_dde(nx_dde_t *ddep, long buf_sz, long page_sz,
> +				int wr)
> +{
> +	uint32_t indirect_count;
> +	uint32_t buf_len;
> +	long total;
> +	uint64_t buf_addr;
> +	nx_dde_t *dde_list;
> +	int i;
> +
> +	assert(!!ddep);
> +
> +	indirect_count = getpnn(ddep, dde_count);
> +
> +	NXPRT(fprintf(stderr, "nx_touch_pages_dde dde_count %d request len \
> +			0x%lx\n", indirect_count, buf_sz));
> +
> +	if (indirect_count == 0) {
> +		/* Direct dde */
> +		buf_len = getp32(ddep, ddebc);
> +		buf_addr = getp64(ddep, ddead);
> +
> +		NXPRT(fprintf(stderr, "touch direct ddebc 0x%x ddead %p\n",
> +				buf_len, (void *)buf_addr));
> +
> +		if (buf_sz == 0)
> +			nx_touch_pages((void *)buf_addr, buf_len, page_sz, wr);
> +		else
> +			nx_touch_pages((void *)buf_addr, NX_MIN(buf_len,
> +					buf_sz), page_sz, wr);
> +
> +		return ERR_NX_OK;
> +	}
> +
> +	/* Indirect dde */
> +	if (indirect_count > MAX_DDE_COUNT)
> +		return ERR_NX_EXCESSIVE_DDE;
> +
> +	/* First address of the list */
> +	dde_list = (nx_dde_t *) getp64(ddep, ddead);
> +
> +	if (buf_sz == 0)
> +		buf_sz = getp32(ddep, ddebc);
> +
> +	total = 0;
> +	for (i = 0; i < indirect_count; i++) {
> +		buf_len = get32(dde_list[i], ddebc);
> +		buf_addr = get64(dde_list[i], ddead);
> +		total += buf_len;
> +
> +		NXPRT(fprintf(stderr, "touch loop len 0x%x ddead %p total \
> +				0x%lx\n", buf_len, (void *)buf_addr, total));
> +
> +		/* Touching fewer pages than encoded in the ddebc */
> +		if (total > buf_sz) {
> +			buf_len = NX_MIN(buf_len, total - buf_sz);
> +			nx_touch_pages((void *)buf_addr, buf_len, page_sz, wr);
> +			NXPRT(fprintf(stderr, "touch loop break len 0x%x \
> +				      ddead %p\n", buf_len, (void *)buf_addr));
> +			break;
> +		}
> +		nx_touch_pages((void *)buf_addr, buf_len, page_sz, wr);
> +	}
> +	return ERR_NX_OK;
> +}
> +
> +/*
> + * Src and dst buffers are supplied in scatter gather lists.
> + * NX function code and other parameters supplied in cmdp.
> + */
> +static int nx_submit_job(nx_dde_t *src, nx_dde_t *dst, nx_gzip_crb_cpb_t *cmdp,
> +			 void *handle)
> +{
> +	int cc;
> +	uint64_t csbaddr;
> +
> +	memset((void *)&cmdp->crb.csb, 0, sizeof(cmdp->crb.csb));
> +
> +	cmdp->crb.source_dde = *src;
> +	cmdp->crb.target_dde = *dst;
> +
> +	/* Status, output byte count in tpbc */
> +	csbaddr = ((uint64_t) &cmdp->crb.csb) & csb_address_mask;
> +	put64(cmdp->crb, csb_address, csbaddr);
> +
> +	/* NX reports input bytes in spbc; cleared */
> +	cmdp->cpb.out_spbc_comp_wrap = 0;
> +	cmdp->cpb.out_spbc_comp_with_count = 0;
> +	cmdp->cpb.out_spbc_decomp = 0;
> +
> +	/* Clear output */
> +	put32(cmdp->cpb, out_crc, INIT_CRC);
> +	put32(cmdp->cpb, out_adler, INIT_ADLER);
> +
> +	cc = nxu_run_job(cmdp, handle);
> +
> +	if (!cc)
> +		cc = getnn(cmdp->crb.csb, csb_cc);	/* CC Table 6-8 */
> +
> +	return cc;
> +}
> +
> +/* fifo queue management */
> +#define fifo_used_bytes(used) (used)
> +#define fifo_free_bytes(used, len) ((len)-(used))
> +/* amount of free bytes in the first and last parts */
> +#define fifo_free_first_bytes(cur, used, len)  ((((cur)+(used)) <= (len)) \
> +						  ? (len)-((cur)+(used)) : 0)
> +#define fifo_free_last_bytes(cur, used, len)   ((((cur)+(used)) <= (len)) \
> +						  ? (cur) : (len)-(used))
> +/* amount of used bytes in the first and last parts */
> +#define fifo_used_first_bytes(cur, used, len)  ((((cur)+(used)) <= (len)) \
> +						  ? (used) : (len)-(cur))
> +#define fifo_used_last_bytes(cur, used, len)   ((((cur)+(used)) <= (len)) \
> +						  ? 0 : ((used)+(cur))-(len))
> +/* first and last free parts start here */
> +#define fifo_free_first_offset(cur, used)      ((cur)+(used))
> +#define fifo_free_last_offset(cur, used, len)  \
> +					   fifo_used_last_bytes(cur, used, len)
> +/* first and last used parts start here */
> +#define fifo_used_first_offset(cur)            (cur)
> +#define fifo_used_last_offset(cur)             (0)
> +
> +int decompress_file(int argc, char **argv, void *devhandle)
> +{
> +	FILE *inpf;
> +	FILE *outf;
> +
> +	int c, expect, i, cc, rc = 0;
> +	char gzfname[1024];
> +
> +	/* Queuing, file ops, byte counting */
> +	char *fifo_in, *fifo_out;
> +	int used_in, cur_in, used_out, cur_out, read_sz, n;
> +	int first_free, last_free, first_used, last_used;
> +	int first_offset, last_offset;
> +	int write_sz, free_space, source_sz;
> +	int source_sz_estimate, target_sz_estimate;
> +	uint64_t last_comp_ratio; /* 1000 max */
> +	uint64_t total_out;
> +	int is_final, is_eof;
> +
> +	/* nx hardware */
> +	int sfbt, subc, spbc, tpbc, nx_ce, fc, resuming = 0;
> +	int history_len = 0;
> +	nx_gzip_crb_cpb_t cmd, *cmdp;
> +	nx_dde_t *ddl_in;
> +	nx_dde_t dde_in[6] __attribute__((aligned (128)));
> +	nx_dde_t *ddl_out;
> +	nx_dde_t dde_out[6] __attribute__((aligned (128)));
> +	int pgfault_retries;
> +
> +	/* when using mmap'ed files */
> +	off_t input_file_offset;
> +
> +	if (argc > 2) {
> +		fprintf(stderr, "usage: %s <fname> or stdin\n", argv[0]);
> +		fprintf(stderr, "    writes to stdout or <fname>.nx.gunzip\n");
> +		return -1;
> +	}
> +
> +	if (argc == 1) {
> +		inpf = stdin;
> +		outf = stdout;
> +	} else if (argc == 2) {
> +		char w[1024];
> +		char *wp;
> +		inpf = fopen(argv[1], "r");
> +		if (inpf == NULL) {
> +			perror(argv[1]);
> +			return -1;
> +		}
> +
> +		/* Make a new file name to write to.  Ignoring '.gz' */
> +		wp = (NULL != (wp = strrchr(argv[1], '/'))) ? ++wp : argv[1];
> +		strcpy(w, wp);
> +		strcat(w, ".nx.gunzip");
> +
> +		outf = fopen(w, "w");
> +		if (outf == NULL) {
> +			perror(w);
> +			return -1;
> +		}
> +	}
> +
> +#define GETINPC(X) fgetc(X)
> +
> +	/* Decode the gzip header */
> +	c = GETINPC(inpf); expect = 0x1f; /* ID1 */
> +	if (c != expect)
> +		goto err1;
> +
> +	c = GETINPC(inpf); expect = 0x8b; /* ID2 */
> +	if (c != expect)
> +		goto err1;
> +
> +	c = GETINPC(inpf); expect = 0x08; /* CM */
> +	if (c != expect)
> +		goto err1;
> +
> +	int flg = GETINPC(inpf); /* FLG */
> +	if (flg & 0b11100000 || flg & 0b100)
> +		goto err2;
> +
> +	fprintf(stderr, "gzHeader FLG %x\n", flg);
> +
> +	/* Read 6 bytes; ignoring the MTIME, XFL, OS fields in this
> +	 * sample code.
> +	 */
> +	for (i = 0; i < 6; i++) {
> +		char tmp[10];
> +		if (EOF == (tmp[i] = GETINPC(inpf)))
> +			goto err3;
> +		fprintf(stderr, "%02x ", tmp[i]);
> +		if (i == 5)
> +			fprintf(stderr, "\n");
> +	}
> +	fprintf(stderr, "gzHeader MTIME, XFL, OS ignored\n");
> +
> +	/* FNAME */
> +	if (flg & 0b1000) {
> +		int k = 0;
> +		do {
> +			if (EOF == (c = GETINPC(inpf)))
> +				goto err3;
> +			gzfname[k++] = c;
> +		} while (c);
> +		fprintf(stderr, "gzHeader FNAME: %s\n", gzfname);
> +	}
> +
> +	/* FHCRC */
> +	if (flg & 0b10) {
> +		c = GETINPC(inpf); c = GETINPC(inpf);
> +		fprintf(stderr, "gzHeader FHCRC: ignored\n");
> +	}
> +
> +	used_in = cur_in = used_out = cur_out = 0;
> +	is_final = is_eof = 0;
> +
> +	/* Allocate one page larger to prevent page faults due to NX
> +	 * overfetching.
> +	 * Either do this (char*)(uintptr_t)aligned_alloc or use
> +	 * -std=c11 flag to make the int-to-pointer warning go away.
> +	 */
> +	assert((fifo_in  = (char *)(uintptr_t)aligned_alloc(line_sz,
> +				   fifo_in_len + page_sz)) != NULL);
> +	assert((fifo_out = (char *)(uintptr_t)aligned_alloc(line_sz,
> +				   fifo_out_len + page_sz + line_sz)) != NULL);
> +	/* Leave unused space due to history rounding rules */
> +	fifo_out = fifo_out + line_sz;
> +	nx_touch_pages(fifo_out, fifo_out_len, page_sz, 1);
> +
> +	ddl_in  = &dde_in[0];
> +	ddl_out = &dde_out[0];
> +	cmdp = &cmd;
> +	memset(&cmdp->crb, 0, sizeof(cmdp->crb));
> +
> +read_state:
> +
> +	/* Read from .gz file */
> +
> +	NXPRT(fprintf(stderr, "read_state:\n"));
> +
> +	if (is_eof != 0)
> +		goto write_state;
> +
> +	/* We read in to fifo_in in two steps: first: read in to from
> +	 * cur_in to the end of the buffer.  last: if free space wrapped
> +	 * around, read from fifo_in offset 0 to offset cur_in.
> +	 */
> +
> +	/* Reset fifo head to reduce unnecessary wrap arounds */
> +	cur_in = (used_in == 0) ? 0 : cur_in;
> +
> +	/* Free space total is reduced by a gap */
> +	free_space = NX_MAX(0, fifo_free_bytes(used_in, fifo_in_len)
> +			    - line_sz);
> +
> +	/* Free space may wrap around as first and last */
> +	first_free = fifo_free_first_bytes(cur_in, used_in, fifo_in_len);
> +	last_free  = fifo_free_last_bytes(cur_in, used_in, fifo_in_len);
> +
> +	/* Start offsets of the free memory */
> +	first_offset = fifo_free_first_offset(cur_in, used_in);
> +	last_offset  = fifo_free_last_offset(cur_in, used_in, fifo_in_len);
> +
> +	/* Reduce read_sz because of the line_sz gap */
> +	read_sz = NX_MIN(free_space, first_free);
> +	n = 0;
> +	if (read_sz > 0) {
> +		/* Read in to offset cur_in + used_in */
> +		n = fread(fifo_in + first_offset, 1, read_sz, inpf);
> +		used_in = used_in + n;
> +		free_space = free_space - n;
> +		assert(n <= read_sz);
> +		if (n != read_sz) {
> +			/* Either EOF or error; exit the read loop */
> +			is_eof = 1;
> +			goto write_state;
> +		}
> +	}
> +
> +	/* If free space wrapped around */
> +	if (last_free > 0) {
> +		/* Reduce read_sz because of the line_sz gap */
> +		read_sz = NX_MIN(free_space, last_free);
> +		n = 0;
> +		if (read_sz > 0) {
> +			n = fread(fifo_in + last_offset, 1, read_sz, inpf);
> +			used_in = used_in + n;       /* Increase used space */
> +			free_space = free_space - n; /* Decrease free space */
> +			assert(n <= read_sz);
> +			if (n != read_sz) {
> +				/* Either EOF or error; exit the read loop */
> +				is_eof = 1;
> +				goto write_state;
> +			}
> +		}
> +	}
> +
> +	/* At this point we have used_in bytes in fifo_in with the
> +	 * data head starting at cur_in and possibly wrapping around.
> +	 */
> +
> +write_state:
> +
> +	/* Write decompressed data to output file */
> +
> +	NXPRT(fprintf(stderr, "write_state:\n"));
> +
> +	if (used_out == 0)
> +		goto decomp_state;
> +
> +	/* If fifo_out has data waiting, write it out to the file to
> +	 * make free target space for the accelerator used bytes in
> +	 * the first and last parts of fifo_out.
> +	 */
> +
> +	first_used = fifo_used_first_bytes(cur_out, used_out, fifo_out_len);
> +	last_used  = fifo_used_last_bytes(cur_out, used_out, fifo_out_len);
> +
> +	write_sz = first_used;
> +
> +	n = 0;
> +	if (write_sz > 0) {
> +		n = fwrite(fifo_out + cur_out, 1, write_sz, outf);
> +		used_out = used_out - n;
> +		/* Move head of the fifo */
> +		cur_out = (cur_out + n) % fifo_out_len;
> +		assert(n <= write_sz);
> +		if (n != write_sz) {
> +			fprintf(stderr, "error: write\n");
> +			rc = -1;
> +			goto err5;
> +		}
> +	}
> +
> +	if (last_used > 0) { /* If more data available in the last part */
> +		write_sz = last_used; /* Keep it here for later */
> +		n = 0;
> +		if (write_sz > 0) {
> +			n = fwrite(fifo_out, 1, write_sz, outf);
> +			used_out = used_out - n;
> +			cur_out = (cur_out + n) % fifo_out_len;
> +			assert(n <= write_sz);
> +			if (n != write_sz) {
> +				fprintf(stderr, "error: write\n");
> +				rc = -1;
> +				goto err5;
> +			}
> +		}
> +	}
> +
> +decomp_state:
> +
> +	/* NX decompresses input data */
> +
> +	NXPRT(fprintf(stderr, "decomp_state:\n"));
> +
> +	if (is_final)
> +		goto finish_state;
> +
> +	/* Address/len lists */
> +	clearp_dde(ddl_in);
> +	clearp_dde(ddl_out);
> +
> +	/* FC, CRC, HistLen, Table 6-6 */
> +	if (resuming) {
> +		/* Resuming a partially decompressed input.
> +		 * The key to resume is supplying the 32KB
> +		 * dictionary (history) to NX, which is basically
> +		 * the last 32KB of output produced.
> +		 */
> +		fc = GZIP_FC_DECOMPRESS_RESUME;
> +
> +		cmdp->cpb.in_crc   = cmdp->cpb.out_crc;
> +		cmdp->cpb.in_adler = cmdp->cpb.out_adler;
> +
> +		/* Round up the history size to quadword.  Section 2.10 */
> +		history_len = (history_len + 15) / 16;
> +		putnn(cmdp->cpb, in_histlen, history_len);
> +		history_len = history_len * 16; /* bytes */
> +
> +		if (history_len > 0) {
> +			/* Chain in the history buffer to the DDE list */
> +			if (cur_out >= history_len) {
> +				nx_append_dde(ddl_in, fifo_out
> +					      + (cur_out - history_len),
> +					      history_len);
> +			} else {
> +				nx_append_dde(ddl_in, fifo_out
> +					      + ((fifo_out_len + cur_out)
> +					      - history_len),
> +					      history_len - cur_out);
> +				/* Up to 32KB history wraps around fifo_out */
> +				nx_append_dde(ddl_in, fifo_out, cur_out);
> +			}
> +
> +		}
> +	} else {
> +		/* First decompress job */
> +		fc = GZIP_FC_DECOMPRESS;
> +
> +		history_len = 0;
> +		/* Writing 0 clears out subc as well */
> +		cmdp->cpb.in_histlen = 0;
> +		total_out = 0;
> +
> +		put32(cmdp->cpb, in_crc, INIT_CRC);
> +		put32(cmdp->cpb, in_adler, INIT_ADLER);
> +		put32(cmdp->cpb, out_crc, INIT_CRC);
> +		put32(cmdp->cpb, out_adler, INIT_ADLER);
> +
> +		/* Assuming 10% compression ratio initially; use the
> +		 * most recently measured compression ratio as a
> +		 * heuristic to estimate the input and output
> +		 * sizes.  If we give too much input, the target buffer
> +		 * overflows and NX cycles are wasted, and then we
> +		 * must retry with smaller input size.  1000 is 100%.
> +		 */
> +		last_comp_ratio = 100UL;
> +	}
> +	cmdp->crb.gzip_fc = 0;
> +	putnn(cmdp->crb, gzip_fc, fc);
> +
> +	/*
> +	 * NX source buffers
> +	 */
> +	first_used = fifo_used_first_bytes(cur_in, used_in, fifo_in_len);
> +	last_used = fifo_used_last_bytes(cur_in, used_in, fifo_in_len);
> +
> +	if (first_used > 0)
> +		nx_append_dde(ddl_in, fifo_in + cur_in, first_used);
> +
> +	if (last_used > 0)
> +		nx_append_dde(ddl_in, fifo_in, last_used);
> +
> +	/*
> +	 * NX target buffers
> +	 */
> +	first_free = fifo_free_first_bytes(cur_out, used_out, fifo_out_len);
> +	last_free = fifo_free_last_bytes(cur_out, used_out, fifo_out_len);
> +
> +	/* Reduce output free space amount not to overwrite the history */
> +	int target_max = NX_MAX(0, fifo_free_bytes(used_out, fifo_out_len)
> +				- (1<<16));
> +
> +	NXPRT(fprintf(stderr, "target_max %d (0x%x)\n", target_max,
> +		      target_max));
> +
> +	first_free = NX_MIN(target_max, first_free);
> +	if (first_free > 0) {
> +		first_offset = fifo_free_first_offset(cur_out, used_out);
> +		nx_append_dde(ddl_out, fifo_out + first_offset, first_free);
> +	}
> +
> +	if (last_free > 0) {
> +		last_free = NX_MIN(target_max - first_free, last_free);
> +		if (last_free > 0) {
> +			last_offset = fifo_free_last_offset(cur_out, used_out,
> +							    fifo_out_len);
> +			nx_append_dde(ddl_out, fifo_out + last_offset,
> +				      last_free);
> +		}
> +	}
> +
> +	/* Target buffer size is used to limit the source data size
> +	 * based on previous measurements of compression ratio.
> +	 */
> +
> +	/* source_sz includes history */
> +	source_sz = getp32(ddl_in, ddebc);
> +	assert(source_sz > history_len);
> +	source_sz = source_sz - history_len;
> +
> +	/* Estimating how much source is needed to 3/4 fill a
> +	 * target_max size target buffer.  If we overshoot, then NX
> +	 * must repeat the job with smaller input and we waste
> +	 * bandwidth.  If we undershoot then we use more NX calls than
> +	 * necessary.
> +	 */
> +
> +	source_sz_estimate = ((uint64_t)target_max * last_comp_ratio * 3UL)
> +				/ 4000;
> +
> +	if (source_sz_estimate < source_sz) {
> +		/* Target might be small, therefore limiting the
> +		 * source data.
> +		 */
> +		source_sz = source_sz_estimate;
> +		target_sz_estimate = target_max;
> +	} else {
> +		/* Source file might be small, therefore limiting target
> +		 * touch pages to a smaller value to save processor cycles.
> +		 */
> +		target_sz_estimate = ((uint64_t)source_sz * 1000UL)
> +					/ (last_comp_ratio + 1);
> +		target_sz_estimate = NX_MIN(2 * target_sz_estimate,
> +					    target_max);
> +	}
> +
> +	source_sz = source_sz + history_len;
> +
> +	/* Some NX condition codes require submitting the NX job again.
> +	 * Kernel doesn't handle NX page faults. Expects user code to
> +	 * touch pages.
> +	 */
> +	pgfault_retries = retry_max;
> +
> +restart_nx:
> +
> +	putp32(ddl_in, ddebc, source_sz);
> +
> +	/* Fault in pages */
> +	nx_touch_pages_dde(ddl_in, 0, page_sz, 0);
> +	nx_touch_pages_dde(ddl_out, target_sz_estimate, page_sz, 1);
> +
> +	/* Send job to NX */
> +	cc = nx_submit_job(ddl_in, ddl_out, cmdp, devhandle);
> +
> +	switch (cc) {
> +
> +	case ERR_NX_TRANSLATION:
> +
> +		/* We touched the pages ahead of time.  In the most common case
> +		 * we shouldn't be here.  But may be some pages were paged out.
> +		 * Kernel should have placed the faulting address to fsaddr.
> +		 */
> +		NXPRT(fprintf(stderr, "ERR_NX_TRANSLATION %p\n",
> +			      (void *)cmdp->crb.csb.fsaddr));
> +
> +		/* Touch 1 byte, read-only  */
> +		nx_touch_pages((void *)cmdp->crb.csb.fsaddr, 1, page_sz, 0);
> +
> +		if (pgfault_retries == retry_max) {
> +			/* Try once with exact number of pages */
> +			--pgfault_retries;
> +			goto restart_nx;
> +		} else if (pgfault_retries > 0) {
> +			/* If still faulting try fewer input pages
> +			 * assuming memory outage
> +			 */
> +			if (source_sz > page_sz)
> +				source_sz = NX_MAX(source_sz / 2, page_sz);
> +			--pgfault_retries;
> +			goto restart_nx;
> +		} else {
> +			fprintf(stderr, "cannot make progress; too many page \
> +				fault retries cc= %d\n", cc);
> +			rc = -1;
> +			goto err5;
> +		}
> +
> +	case ERR_NX_DATA_LENGTH:
> +
> +		NXPRT(fprintf(stderr, "ERR_NX_DATA_LENGTH; not an error \
> +			      usually; stream may have trailing data\n"));
> +
> +		/* Not an error in the most common case; it just says
> +		 * there is trailing data that we must examine.
> +		 *
> +		 * CC=3 CE(1)=0 CE(0)=1 indicates partial completion
> +		 * Fig.6-7 and Table 6-8.
> +		 */
> +		nx_ce = get_csb_ce_ms3b(cmdp->crb.csb);
> +
> +		if (!csb_ce_termination(nx_ce) &&
> +		    csb_ce_partial_completion(nx_ce)) {
> +			/* Check CPB for more information
> +			 * spbc and tpbc are valid
> +			 */
> +			sfbt = getnn(cmdp->cpb, out_sfbt); /* Table 6-4 */
> +			subc = getnn(cmdp->cpb, out_subc); /* Table 6-4 */
> +			spbc = get32(cmdp->cpb, out_spbc_decomp);
> +			tpbc = get32(cmdp->crb.csb, tpbc);
> +			assert(target_max >= tpbc);
> +
> +			goto ok_cc3; /* not an error */
> +		} else {
> +			/* History length error when CE(1)=1 CE(0)=0. */
> +			rc = -1;
> +			fprintf(stderr, "history length error cc= %d\n", cc);
> +			goto err5;
> +		}
> +
> +	case ERR_NX_TARGET_SPACE:
> +
> +		/* Target buffer not large enough; retry smaller input
> +		 * data; give at least 1 byte.  SPBC/TPBC are not valid.
> +		 */
> +		assert(source_sz > history_len);
> +		source_sz = ((source_sz - history_len + 2) / 2) + history_len;
> +		NXPRT(fprintf(stderr, "ERR_NX_TARGET_SPACE; retry with \
> +			      smaller input data src %d hist %d\n", source_sz,
> +			      history_len));
> +		goto restart_nx;
> +
> +	case ERR_NX_OK:
> +
> +		/* This should not happen for gzip formatted data;
> +		 * we need trailing crc and isize
> +		 */
> +		fprintf(stderr, "ERR_NX_OK\n");
> +		spbc = get32(cmdp->cpb, out_spbc_decomp);
> +		tpbc = get32(cmdp->crb.csb, tpbc);
> +		assert(target_max >= tpbc);
> +		assert(spbc >= history_len);
> +		source_sz = spbc - history_len;
> +		goto offsets_state;
> +
> +	default:
> +		fprintf(stderr, "error: cc= %d\n", cc);
> +		rc = -1;
> +		goto err5;
> +	}
> +
> +ok_cc3:
> +
> +	NXPRT(fprintf(stderr, "cc3: sfbt: %x\n", sfbt));
> +
> +	assert(spbc > history_len);
> +	source_sz = spbc - history_len;
> +
> +	/* Table 6-4: Source Final Block Type (SFBT) describes the
> +	 * last processed deflate block and clues the software how to
> +	 * resume the next job.  SUBC indicates how many input bits NX
> +	 * consumed but did not process.  SPBC indicates how many
> +	 * bytes of source were given to the accelerator including
> +	 * history bytes.
> +	 */
> +
> +	switch (sfbt) {
> +		int dhtlen;
> +
> +	case 0b0000: /* Deflate final EOB received */
> +
> +		/* Calculating the checksum start position. */
> +
> +		source_sz = source_sz - subc / 8;
> +		is_final = 1;
> +		break;
> +
> +		/* Resume decompression cases are below. Basically
> +		 * indicates where NX has suspended and how to resume
> +		 * the input stream.
> +		 */
> +
> +	case 0b1000: /* Within a literal block; use rembytecount */
> +	case 0b1001: /* Within a literal block; use rembytecount; bfinal=1 */
> +
> +		/* Supply the partially processed source byte again */
> +		source_sz = source_sz - ((subc + 7) / 8);
> +
> +		/* SUBC LS 3bits: number of bits in the first source byte need
> +		 * to be processed.
> +		 * 000 means all 8 bits;  Table 6-3
> +		 * Clear subc, histlen, sfbt, rembytecnt, dhtlen
> +		 */
> +		cmdp->cpb.in_subc = 0;
> +		cmdp->cpb.in_sfbt = 0;
> +		putnn(cmdp->cpb, in_subc, subc % 8);
> +		putnn(cmdp->cpb, in_sfbt, sfbt);
> +		putnn(cmdp->cpb, in_rembytecnt, getnn(cmdp->cpb,
> +						      out_rembytecnt));
> +		break;
> +
> +	case 0b1010: /* Within a FH block; */
> +	case 0b1011: /* Within a FH block; bfinal=1 */
> +
> +		source_sz = source_sz - ((subc + 7) / 8);
> +
> +		/* Clear subc, histlen, sfbt, rembytecnt, dhtlen */
> +		cmdp->cpb.in_subc = 0;
> +		cmdp->cpb.in_sfbt = 0;
> +		putnn(cmdp->cpb, in_subc, subc % 8);
> +		putnn(cmdp->cpb, in_sfbt, sfbt);
> +		break;
> +
> +	case 0b1100: /* Within a DH block; */
> +	case 0b1101: /* Within a DH block; bfinal=1 */
> +
> +		source_sz = source_sz - ((subc + 7) / 8);
> +
> +		/* Clear subc, histlen, sfbt, rembytecnt, dhtlen */
> +		cmdp->cpb.in_subc = 0;
> +		cmdp->cpb.in_sfbt = 0;
> +		putnn(cmdp->cpb, in_subc, subc % 8);
> +		putnn(cmdp->cpb, in_sfbt, sfbt);
> +
> +		dhtlen = getnn(cmdp->cpb, out_dhtlen);
> +		putnn(cmdp->cpb, in_dhtlen, dhtlen);
> +		assert(dhtlen >= 42);
> +
> +		/* Round up to a qword */
> +		dhtlen = (dhtlen + 127) / 128;
> +
> +		while (dhtlen > 0) { /* Copy dht from cpb.out to cpb.in */
> +			--dhtlen;
> +			cmdp->cpb.in_dht[dhtlen] = cmdp->cpb.out_dht[dhtlen];
> +		}
> +		break;
> +
> +	case 0b1110: /* Within a block header; bfinal=0; */
> +		     /* Also given if source data exactly ends (SUBC=0) with
> +		      * EOB code with BFINAL=0.  Means the next byte will
> +		      * contain a block header.
> +		      */
> +	case 0b1111: /* within a block header with BFINAL=1. */
> +
> +		source_sz = source_sz - ((subc + 7) / 8);
> +
> +		/* Clear subc, histlen, sfbt, rembytecnt, dhtlen */
> +		cmdp->cpb.in_subc = 0;
> +		cmdp->cpb.in_sfbt = 0;
> +		putnn(cmdp->cpb, in_subc, subc % 8);
> +		putnn(cmdp->cpb, in_sfbt, sfbt);
> +	}
> +
> +offsets_state:
> +
> +	/* Adjust the source and target buffer offsets and lengths  */
> +
> +	NXPRT(fprintf(stderr, "offsets_state:\n"));
> +
> +	/* Delete input data from fifo_in */
> +	used_in = used_in - source_sz;
> +	cur_in = (cur_in + source_sz) % fifo_in_len;
> +	input_file_offset = input_file_offset + source_sz;
> +
> +	/* Add output data to fifo_out */
> +	used_out = used_out + tpbc;
> +
> +	assert(used_out <= fifo_out_len);
> +
> +	total_out = total_out + tpbc;
> +
> +	/* Deflate history is 32KB max.  No need to supply more
> +	 * than 32KB on a resume.
> +	 */
> +	history_len = (total_out > window_max) ? window_max : total_out;
> +
> +	/* To estimate expected expansion in the next NX job; 500 means 50%.
> +	 * Deflate best case is around 1 to 1000.
> +	 */
> +	last_comp_ratio = (1000UL * ((uint64_t)source_sz + 1))
> +			  / ((uint64_t)tpbc + 1);
> +	last_comp_ratio = NX_MAX(NX_MIN(1000UL, last_comp_ratio), 1);
> +	NXPRT(fprintf(stderr, "comp_ratio %ld source_sz %d spbc %d tpbc %d\n",
> +		      last_comp_ratio, source_sz, spbc, tpbc));
> +
> +	resuming = 1;
> +
> +finish_state:
> +
> +	NXPRT(fprintf(stderr, "finish_state:\n"));
> +
> +	if (is_final) {
> +		if (used_out)
> +			goto write_state; /* More data to write out */
> +		else if (used_in < 8) {
> +			/* Need at least 8 more bytes containing gzip crc
> +			 * and isize.
> +			 */
> +			rc = -1;
> +			goto err4;
> +		} else {
> +			/* Compare checksums and exit */
> +			int i;
> +			char tail[8];
> +			uint32_t cksum, isize;
> +			for (i = 0; i < 8; i++)
> +				tail[i] = fifo_in[(cur_in + i) % fifo_in_len];
> +			fprintf(stderr, "computed checksum %08x isize %08x\n",
> +				cmdp->cpb.out_crc, (uint32_t) (total_out
> +				% (1ULL<<32)));
> +			cksum = (tail[0] | tail[1]<<8 | tail[2]<<16
> +				| tail[3]<<24);
> +			isize = (tail[4] | tail[5]<<8 | tail[6]<<16
> +				| tail[7]<<24);
> +			fprintf(stderr, "stored   checksum %08x isize %08x\n",
> +				cksum, isize);
> +
> +			if (cksum == cmdp->cpb.out_crc && isize == (uint32_t)
> +			    (total_out % (1ULL<<32))) {
> +				rc = 0;	goto ok1;
> +			} else {
> +				rc = -1; goto err4;
> +			}
> +		}
> +	} else
> +		goto read_state;
> +
> +	return -1;
> +
> +err1:
> +	fprintf(stderr, "error: not a gzip file, expect %x, read %x\n",
> +		expect, c);
> +	return -1;
> +
> +err2:
> +	fprintf(stderr, "error: the FLG byte is wrong or not handled by this \
> +		code sample\n");
> +	return -1;
> +
> +err3:
> +	fprintf(stderr, "error: gzip header\n");
> +	return -1;
> +
> +err4:
> +	fprintf(stderr, "error: checksum\n");
> +
> +err5:
> +ok1:
> +	fprintf(stderr, "decomp is complete: fclose\n");
> +	fclose(outf);
> +
> +	return rc;
> +}
> +
> +
> +int main(int argc, char **argv)
> +{
> +	int rc;
> +	struct sigaction act;
> +	void *handle;
> +
> +	act.sa_handler = 0;
> +	act.sa_sigaction = sigsegv_handler;
> +	act.sa_flags = SA_SIGINFO;
> +	act.sa_restorer = 0;
> +	sigemptyset(&act.sa_mask);
> +	sigaction(SIGSEGV, &act, NULL);
> +
> +	handle = nx_function_begin(NX_FUNC_COMP_GZIP, 0);
> +	if (!handle) {
> +		fprintf(stderr, "Unable to init NX, errno %d\n", errno);
> +		exit(-1);
> +	}
> +
> +	rc = decompress_file(argc, argv, handle);
> +
> +	nx_function_end(handle);
> +
> +	return rc;
> +}
> -- 
> 2.21.0

--=-=-=--
