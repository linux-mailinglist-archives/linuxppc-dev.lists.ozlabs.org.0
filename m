Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD74A8C17FD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 22:55:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb46W31GSz3cXx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 06:55:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.175; helo=mail-pg1-f175.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb4653fYGz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 06:55:23 +1000 (AEST)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5d3907ff128so1067380a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 13:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715288121; x=1715892921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SeDxTMUgi4LQzDaIf3nLrPy70uwzF3gPdETUheci2c=;
        b=BT6SaeMscYO9A9HfJ2sNRPX2kRx9/138VpX2rsph/CGc/HfHt5EJPtlcYAwZcdhW0B
         mteRMG+AK/BIUOvbkNWzvgtWEWABBKlX090ldd6bgua74cSGnmlw2IA3S9y8o9PdyENE
         sO5wCk7DsnY49T7actu32QB7DdH1N2xNtuvIDONxpZBlt4zmONZuDDT/AT41SWHlDBSW
         l/i9NVK14TUWp6jj1gkHGa7ivI3ZfjGrl8zFGu1KsHQunXFfU0I3IfG0hrCCXMBgUnnQ
         xTqfIEiygPFot3AqMRjzZYgtW4Qw4gqiMurfIN+RWe632G0GSfI/M9TjCjjVISpKsJtI
         XKfA==
X-Forwarded-Encrypted: i=1; AJvYcCXJkYczc0vaXmy6TsINVq6ReHdj8+SXR8bz3ygX0ysTmbriNq4nTQ4xZ4s89SbyyO9C/PZyD98up1/HBh7fQZ5HHHpV1YrI9RuPMPjosw==
X-Gm-Message-State: AOJu0YyJZns+IKhZ7b+T8C7+VFkZMSGQDyLvRA7aDzW6KljwAr/SYw4M
	EO4kcIwY3qYDxTDVr4nBTC2QMkVmIt6rs7rK9DrW4xvlHYCieLp8oarg6BP1S3Pzc6TFTQ9IpHs
	y8vdBLlIGRRNR9V1QRlDIqhXpRXg=
X-Google-Smtp-Source: AGHT+IGt7dUBfj7vMg0wI6ai8p0bGzNoXrhnZsLwOgnLclMfrb2jDrhK/Kigc+vuxjYxxWNl1dT8N/6AVYpASWN8wPY=
X-Received: by 2002:a17:90a:db97:b0:2b2:7e94:4073 with SMTP id
 98e67ed59e1d1-2b6cc76d73cmr727950a91.14.1715288121009; Thu, 09 May 2024
 13:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-5-atrajeev@linux.vnet.ibm.com> <f2efdb9d-e636-4678-b492-83d3a28d8134@csgroup.eu>
 <E21FF3FD-1080-4A6C-99B0-7239AD831532@linux.vnet.ibm.com>
In-Reply-To: <E21FF3FD-1080-4A6C-99B0-7239AD831532@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Thu, 9 May 2024 13:55:09 -0700
Message-ID: <CAM9d7cjz-_6m7mPATeRETFudz8+u=JYw20Kn6WutEKZ2f6VUyg@mail.gmail.com>
Subject: Re: [PATCH V2 4/9] tools/perf: Add support to capture and parse raw
 instruction in objdump
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Ian Rogers <irogers@google.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>, "akanksha@linux.ibm.com" <akanksha@linux.ibm.com>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 9, 2024 at 10:27=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 7 May 2024, at 3:05=E2=80=AFPM, Christophe Leroy <christophe.leroy@c=
sgroup.eu> wrote:
> >
> >
> >
> > Le 06/05/2024 =C3=A0 14:19, Athira Rajeev a =C3=A9crit :
> >> Add support to capture and parse raw instruction in objdump.
> >
> > What's the purpose of using 'objdump' for reading raw instructions ?
> > Can't they be read directly without invoking 'objdump' ? It looks odd t=
o
> > me to use objdump to provide readable text and then parse it back.
>
> Hi Christophe,
>
> Thanks for your review comments.
>
> Current implementation for data type profiling on X86 uses "objdump" tool=
 to get the disassembled code.
> And then the objdump result lines are parsed to get the instruction name =
and register fields. The initial patchset I posted to enable the data type =
profiling feature in powerpc was using the same way by getting disassembled=
 code from objdump and parsing the disassembled lines. But in V2, we are in=
troducing change for powerpc to use "raw instruction" and fetch opcode, reg=
 fields from the raw instruction.
>
> I tried to explain below that current objdump uses option "--no-show-raw-=
insn" which doesn't capture raw instruction.  So to capture raw instruction=
, V2 patchset has changes to use default option "--show-raw-insn" and get t=
he raw instruction [ for powerpc ] along with human readable annotation [ w=
hich is used by other archs ]. Since perf tool already has objdump implemen=
tation in place, I went in the direction to enhance it to use "--show-raw-i=
nsn" for powerpc purpose.
>
> But as you mentioned, we can directly read raw instruction without using =
"objdump" tool.
> perf has support to read object code. The dso open/read utilities and hel=
per functions are already present in "util/dso.c" And "dso__data_read_offse=
t" function reads data from dso file offset. We can use these functions and=
 I can make changes to directly read binary instruction without using objdu=
mp.
>
> Namhyung, Arnaldo, Christophe
> Looking for your valuable feedback on this approach. Please suggest if th=
is approach looks fine

Looks like you want to implement instruction decoding
like in arch/x86/lib/{insn,inat}.c.  I think it's ok to do that
but you need to decide which way is more convenient.

Also it works on the struct disasm_line so you need to
fill in the necessary info when not using objdump.  As
long as it produces the same output I don't care much
if you use objdump or not.  Actually it uses libcapstone
to disassemble x86 instructions if possible.  Maybe you
can use that on powerpc too.

Thanks,
Namhyung

>
>
> Thanks
> Athira
> >
> >> Currently, the perf tool infrastructure uses "--no-show-raw-insn" opti=
on
> >> with "objdump" while disassemble. Example from powerpc with this optio=
n
> >> for an instruction address is:
> >
> > Yes and that makes sense because the purpose of objdump is to provide
> > human readable annotations, not to perform automated analysis. Am I
> > missing something ?
> >
> >>
> >> Snippet from:
> >> objdump  --start-address=3D<address> --stop-address=3D<address>  -d --=
no-show-raw-insn -C <vmlinux>
> >>
> >> c0000000010224b4: lwz     r10,0(r9)
> >>
> >> This line "lwz r10,0(r9)" is parsed to extract instruction name,
> >> registers names and offset. Also to find whether there is a memory
> >> reference in the operands, "memory_ref_char" field of objdump is used.
> >> For x86, "(" is used as memory_ref_char to tackle instructions of the
> >> form "mov  (%rax), %rcx".
> >>
> >> In case of powerpc, not all instructions using "(" are the only memory
> >> instructions. Example, above instruction can also be of extended form =
(X
> >> form) "lwzx r10,0,r19". Inorder to easy identify the instruction categ=
ory
> >> and extract the source/target registers, patch adds support to use raw
> >> instruction. With raw instruction, macros are added to extract opcode
> >> and register fields.
> >>
> >> "struct ins_operands" and "struct ins" is updated to carry opcode and
> >> raw instruction binary code (raw_insn). Function "disasm_line__parse"
> >> is updated to fill the raw instruction hex value and opcode in newly
> >> added fields. There is no changes in existing code paths, which parses
> >> the disassembled code. The architecture using the instruction name and
> >> present approach is not altered. Since this approach targets powerpc,
> >> the macro implementation is added for powerpc as of now.
> >>
> >> Example:
> >> representation using --show-raw-insn in objdump gives result:
> >>
> >> 38 01 81 e8     ld      r4,312(r1)
> >>
> >> Here "38 01 81 e8" is the raw instruction representation. In powerpc,
> >> this translates to instruction form: "ld RT,DS(RA)" and binary code
> >> as:
> >> _____________________________________
> >> | 58 |  RT  |  RA |      DS       | |
> >> -------------------------------------
> >> 0    6     11    16              30 31
> >>
> >> Function "disasm_line__parse" is updated to capture:
> >>
> >> line:    38 01 81 e8     ld      r4,312(r1)
> >> opcode and raw instruction "38 01 81 e8"
> >> Raw instruction is used later to extract the reg/offset fields.
> >>
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> ---
>
